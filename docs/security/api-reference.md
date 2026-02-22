# PixelRTS Security API Reference

Complete API reference for the PixelRTS Phase 4 Security modules.

## Table of Contents

1. [CLI Authentication Module (cli_auth.py)](#cli-authentication-module)
2. [OAuth2 Provider Module (oauth2_provider.py)](#oauth2-provider-module)
3. [API Key Manager (apikey_manager.py)](#api-key-manager)
4. [RBAC Engine (rbac.py)](#rbac-engine)
5. [Permissions Module (permissions.py)](#permissions-module)
6. [Audit Logger (audit_logger.py)](#audit-logger)
7. [Crypto Module (crypto.py)](#crypto-module)
8. [Token Manager (token_manager.py)](#token-manager)

---

## CLI Authentication Module

### `AuthContext`

Main class managing authentication and user management for CLI commands.

#### Class Definition

```python
class AuthContext:
    def __init__(self, config_dir: str = None, encryption_key: bytes = None)
```

**Parameters:**
- `config_dir` (str, optional): Directory for storing configuration and user data. Defaults to `~/.pixelrts/`
- `encryption_key` (bytes, optional): Key for encrypting sensitive data.

**Attributes:**
- `config_dir` (Path): Configuration directory path
- `secret_key` (str): JWT secret key for token generation
- `users` (Dict[str, Dict]): User storage dictionary

#### Methods

##### `create_user`

```python
def create_user(
    self,
    username: str,
    email: str,
    password: str,
    roles: List[str]
) -> bool
```

Create a new user account.

**Parameters:**
- `username` (str): Unique username
- `email` (str): User email address
- `password` (str): Plain text password (will be hashed)
- `roles` (List[str]): List of role names

**Returns:**
- `bool`: True if user was created, False if username already exists

**Raises:**
- `ValueError`: If an invalid role is specified

**Example:**
```python
from auth.cli_auth import AuthContext

ctx = AuthContext()
success = ctx.create_user(
    username="john_doe",
    email="john@example.com",
    password="SecurePass123!",
    roles=["operator"]
)
```

##### `authenticate`

```python
def authenticate(self, username: str, password: str) -> Optional[Dict[str, Any]]
```

Authenticate a user with username and password.

**Parameters:**
- `username` (str): Username to authenticate
- `password` (str): Plain text password

**Returns:**
- `Optional[Dict[str, Any]]`: User dict if successful, None otherwise

**Example:**
```python
user = ctx.authenticate("john_doe", "SecurePass123!")
if user:
    print(f"Welcome, {user['username']}")
```

##### `login`

```python
def login(self, username: str, password: str) -> Optional[str]
```

Login a user and return a JWT access token.

**Parameters:**
- `username` (str): Username to login
- `password` (str): Plain text password

**Returns:**
- `Optional[str]`: JWT access token string if successful, None otherwise

**Example:**
```python
token = ctx.login("john_doe", "SecurePass123!")
if token:
    print(f"Token: {token}")
```

##### `get_current_user`

```python
def get_current_user(self, token: str) -> Optional[Dict[str, Any]]
```

Get user from JWT token.

**Parameters:**
- `token` (str): JWT access token

**Returns:**
- `Optional[Dict[str, Any]]`: User dict if token valid, None otherwise

**Example:**
```python
user = ctx.get_current_user(token)
if user:
    print(f"Logged in as: {user['username']}")
```

### Functions

##### `get_auth_context`

```python
def get_auth_context() -> AuthContext
```

Get the global auth context singleton.

**Returns:**
- `AuthContext`: Global auth context instance

**Example:**
```python
from auth.cli_auth import get_auth_context

ctx = get_auth_context()
```

##### `require_auth`

```python
def require_auth(func: Callable) -> Callable
```

Decorator to require authentication for a CLI command.

**Parameters:**
- `func` (Callable): Function to decorate

**Returns:**
- `Callable`: Decorated function that requires authentication

**Raises:**
- `PermissionError`: If authentication fails

**Example:**
```python
from auth.cli_auth import require_auth

@require_auth
def protected_command(user):
    print(f"Hello, {user['username']}")

# Usage: protected_command() - user is injected automatically
```

##### `_save_token_to_file`

```python
def _save_token_to_file(token: str, config_dir: str = None)
```

Save a token to the token file with secure permissions (0o600).

**Parameters:**
- `token` (str): JWT token string
- `config_dir` (str, optional): Configuration directory

**Example:**
```python
from auth.cli_auth import _save_token_to_file

_save_token_to_file(token)
```

##### `_load_token_from_file`

```python
def _load_token_from_file(config_dir: str = None) -> Optional[str]
```

Load a token from the token file.

**Parameters:**
- `config_dir` (str, optional): Configuration directory

**Returns:**
- `Optional[str]`: Token string if file exists, None otherwise

**Example:**
```python
from auth.cli_auth import _load_token_from_file

token = _load_token_from_file()
```

##### `_remove_token_file`

```python
def _remove_token_file(config_dir: str = None)
```

Remove the token file (logout).

**Parameters:**
- `config_dir` (str, optional): Configuration directory

**Example:**
```python
from auth.cli_auth import _remove_token_file

_remove_token_file()
```

##### `prompt_for_password`

```python
def prompt_for_password(prompt: str = "Password: ") -> str
```

Prompt for password without echoing.

**Parameters:**
- `prompt` (str): Prompt string to display

**Returns:**
- `str`: Password string

**Example:**
```python
from auth.cli_auth import prompt_for_password

password = prompt_for_password("Enter your password: ")
```

##### `prompt_for_username`

```python
def prompt_for_username(default: str = None) -> str
```

Prompt for username with optional default.

**Parameters:**
- `default` (str, optional): Default username if user just presses Enter

**Returns:**
- `str`: Username string

**Example:**
```python
from auth.cli_auth import prompt_for_username

username = prompt_for_username(default="admin")
```

---

## OAuth2 Provider Module

### `OAuth2Provider`

Class for integrating with OAuth2 identity providers.

#### Class Definition

```python
class OAuth2Provider:
    def __init__(
        self,
        provider_name: str,
        client_id: str,
        client_secret: str,
        authorization_url: str,
        token_url: str,
        userinfo_url: str,
        redirect_uri: str = None,
        scope: str = "openid email profile"
    )
```

**Parameters:**
- `provider_name` (str): Name of the OAuth2 provider
- `client_id` (str): OAuth2 client ID
- `client_secret` (str): OAuth2 client secret
- `authorization_url` (str): OAuth2 authorization endpoint URL
- `token_url` (str): OAuth2 token endpoint URL
- `userinfo_url` (str): OAuth2 userinfo endpoint URL
- `redirect_uri` (str, optional): OAuth2 redirect URI
- `scope` (str, optional): OAuth2 scope. Defaults to "openid email profile"

#### Methods

##### `get_authorization_url`

```python
def get_authorization_url(state: str = None) -> str
```

Generate the authorization URL for OAuth2 flow.

**Parameters:**
- `state` (str, optional): CSRF protection token

**Returns:**
- `str`: Authorization URL

**Example:**
```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="google",
    client_id="your-client-id",
    client_secret="your-client-secret",
    authorization_url="https://accounts.google.com/o/oauth2/v2/auth",
    token_url="https://oauth2.googleapis.com/token",
    userinfo_url="https://www.googleapis.com/oauth2/v2/userinfo"
)

auth_url = provider.get_authorization_url()
print(f"Visit: {auth_url}")
```

##### `exchange_code_for_token`

```python
def exchange_code_for_token(code: str) -> Dict[str, Any]
```

Exchange authorization code for access token.

**Parameters:**
- `code` (str): Authorization code from OAuth2 callback

**Returns:**
- `Dict[str, Any]`: Token response containing access_token, refresh_token, etc.

**Example:**
```python
tokens = provider.exchange_code_for_token(code)
access_token = tokens['access_token']
```

##### `get_user_info`

```python
def get_user_info(access_token: str) -> Dict[str, Any]
```

Get user information from OAuth2 provider.

**Parameters:**
- `access_token` (str): OAuth2 access token

**Returns:**
- `Dict[str, Any]`: User information

**Example:**
```python
user_info = provider.get_user_info(access_token)
email = user_info['email']
name = user_info['name']
```

##### `refresh_token`

```python
def refresh_token(refresh_token: str) -> Dict[str, Any]
```

Refresh an expired access token.

**Parameters:**
- `refresh_token` (str): Refresh token

**Returns:**
- `Dict[str, Any]`: New token response

**Example:**
```python
new_tokens = provider.refresh_token(refresh_token)
access_token = new_tokens['access_token']
```

---

## API Key Manager

### `APIKeyManager`

Class for managing API keys with rate limiting.

#### Class Definition

```python
class APIKeyManager:
    def __init__(self, storage_path: str = None)
```

**Parameters:**
- `storage_path` (str, optional): Path to API key storage file

#### Methods

##### `create_key`

```python
def create_key(
    self,
    user_id: str,
    name: str,
    scopes: List[str],
    rate_limit: int = None,
    expires_in: int = None
) -> APIKey
```

Create a new API key.

**Parameters:**
- `user_id` (str): User ID who owns the key
- `name` (str): Human-readable name for the key
- `scopes` (List[str]): List of permission scopes
- `rate_limit` (int, optional): Requests per hour limit
- `expires_in` (int, optional): Expiration time in seconds

**Returns:**
- `APIKey`: Created API key object

**Example:**
```python
from auth.apikey_manager import APIKeyManager

manager = APIKeyManager()
api_key = manager.create_key(
    user_id="john_doe",
    name="Production API Key",
    scopes=["files:read", "files:create"],
    rate_limit=1000
)
print(f"Key: {api_key.key}")
print(f"Secret: {api_key.secret}")
```

##### `validate_key`

```python
def validate_key(self, key: str, secret: str) -> Optional[APIKey]
```

Validate an API key.

**Parameters:**
- `key` (str): API key identifier
- `secret` (str): API key secret

**Returns:**
- `Optional[APIKey]`: API key object if valid, None otherwise

**Example:**
```python
api_key = manager.validate_key(key, secret)
if api_key:
    print(f"Valid key for user: {api_key.user_id}")
```

##### `check_rate_limit`

```python
def check_rate_limit(self, key: str) -> bool
```

Check if API key has exceeded rate limit.

**Parameters:**
- `key` (str): API key identifier

**Returns:**
- `bool`: True if within rate limit, False if exceeded

**Example:**
```python
if manager.check_rate_limit(key):
    # Process request
    pass
else:
    # Return 429 Too Many Requests
    pass
```

##### `revoke_key`

```python
def revoke_key(self, key_id: str) -> bool
```

Revoke an API key.

**Parameters:**
- `key_id` (str): API key ID to revoke

**Returns:**
- `bool`: True if revoked successfully

**Example:**
```python
manager.revoke_key(key_id)
```

---

## RBAC Engine

### `RBACEngine`

Role-Based Access Control engine for permission checks.

#### Class Definition

```python
class RBACEngine:
    def __init__(self, users: Dict[str, User] = None, roles: Dict[str, Role] = None)
```

#### Methods

##### `has_permission`

```python
def has_permission(self, user: Dict, resource: str, action: str) -> bool
```

Check if user has permission for resource/action.

**Parameters:**
- `user` (Dict): User dictionary
- `resource` (str): Resource identifier
- `action` (str): Action to perform

**Returns:**
- `bool`: True if user has permission

**Example:**
```python
from auth.rbac import RBACEngine

engine = RBACEngine()
if engine.has_permission(user, "files", "create"):
    # Allow file creation
    pass
```

##### `get_user_permissions`

```python
def get_user_permissions(self, user: Dict) -> Set[Permission]
```

Get all permissions for a user.

**Parameters:**
- `user` (Dict): User dictionary

**Returns:**
- `Set[Permission]`: Set of permissions

**Example:**
```python
permissions = engine.get_user_permissions(user)
for perm in permissions:
    print(f"{perm.resource}:{perm.action}")
```

---

## Permissions Module

### `Resource`

Enum of available resources.

```python
class Resource(str, Enum):
    FILES = "files"
    CONVERSION = "conversion"
    BENCHMARKS = "benchmarks"
    DASHBOARD = "dashboard"
    USERS = "users"
    ROLES = "roles"
    SETTINGS = "settings"
    API_KEYS = "api_keys"
    AUDIT_LOGS = "audit_logs"
```

### `Action`

Enum of available actions.

```python
class Action(str, Enum):
    CREATE = "create"
    READ = "read"
    UPDATE = "update"
    DELETE = "delete"
    EXECUTE = "execute"
    ADMIN = "admin"
```

### `Permission`

Data class representing a permission.

```python
@dataclass(frozen=True)
class Permission:
    resource: Resource
    actions: Set[Action]
    scope: str
```

### `ROLE_DEFINITIONS`

Predefined role definitions.

```python
ROLE_DEFINITIONS: Dict[str, List[str]] = {
    "viewer": ["files:read:files:*", ...],
    "operator": ["files:create:files:*", ...],
    "admin": ["*:*:*"],
    "auditor": ["audit_logs:read:audit_logs:*", ...]
}
```

---

## Audit Logger

### `AuditLogger`

Class for logging and querying security events.

#### Class Definition

```python
class AuditLogger:
    def __init__(self, log_file: str = None)
```

#### Methods

##### `log`

```python
def log(
    self,
    action: str,
    user_id: str,
    resource_id: str = None,
    details: Dict = None
)
```

Log an audit event.

**Parameters:**
- `action` (str): Action performed
- `user_id` (str): User who performed the action
- `resource_id` (str, optional): Resource affected
- `details` (Dict, optional): Additional event details

**Example:**
```python
from auth.audit_logger import AuditLogger

logger = AuditLogger()
logger.log(
    action="files:create",
    user_id="john_doe",
    resource_id="files:123",
    details={"size": 1024, "format": "rts.png"}
)
```

##### `query`

```python
def query(
    self,
    user_id: str = None,
    action: str = None,
    resource_id: str = None,
    start_time: datetime = None,
    end_time: datetime = None
) -> List[AuditEvent]
```

Query audit logs.

**Parameters:**
- `user_id` (str, optional): Filter by user
- `action` (str, optional): Filter by action
- `resource_id` (str, optional): Filter by resource
- `start_time` (datetime, optional): Filter start time
- `end_time` (datetime, optional): Filter end time

**Returns:**
- `List[AuditEvent]`: List of matching audit events

**Example:**
```python
events = logger.query(user_id="john_doe", action="files:create")
```

##### `export_to_json`

```python
def export_to_json(self, filename: str, events: List[AuditEvent] = None)
```

Export audit logs to JSON file.

**Parameters:**
- `filename` (str): Output filename
- `events` (List[AuditEvent], optional): Events to export (default: all)

**Example:**
```python
logger.export_to_json("audit_logs.json")
```

---

## Crypto Module

### Functions

##### `encrypt_data`

```python
def encrypt_data(data: bytes, key: bytes) -> bytes
```

Encrypt data using AES-256-GCM.

**Parameters:**
- `data` (bytes): Data to encrypt
- `key` (bytes): Encryption key (32 bytes)

**Returns:**
- `bytes`: Encrypted data

**Example:**
```python
from auth.crypto import encrypt_data

encrypted = encrypt_data(b"sensitive data", encryption_key)
```

##### `decrypt_data`

```python
def decrypt_data(encrypted_data: bytes, key: bytes) -> bytes
```

Decrypt data encrypted with `encrypt_data`.

**Parameters:**
- `encrypted_data` (bytes): Data to decrypt
- `key` (bytes): Decryption key (32 bytes)

**Returns:**
- `bytes`: Decrypted data

**Example:**
```python
from auth.crypto import decrypt_data

decrypted = decrypt_data(encrypted, encryption_key)
```

---

## Token Manager

### `TokenManager`

Class for managing JWT tokens.

#### Methods

##### `create_token`

```python
def create_token(
    self,
    user_id: str,
    additional_claims: Dict = None,
    expiration_hours: int = 24
) -> str
```

Create a JWT token.

**Parameters:**
- `user_id` (str): User ID
- `additional_claims` (Dict, optional): Additional JWT claims
- `expiration_hours` (int): Token expiration in hours

**Returns:**
- `str`: JWT token

**Example:**
```python
from auth.token_manager import TokenManager

manager = TokenManager()
token = manager.create_token(
    user_id="john_doe",
    additional_claims={"roles": ["operator"]}
)
```

##### `verify_token`

```python
def verify_token(self, token: str) -> Dict[str, Any]
```

Verify a JWT token.

**Parameters:**
- `token` (str): JWT token

**Returns:**
- `Dict[str, Any]`: Decoded token payload

**Raises:**
- `jwt.ExpiredSignatureError`: Token has expired
- `jwt.InvalidTokenError`: Token is invalid

**Example:**
```python
try:
    payload = manager.verify_token(token)
    user_id = payload['sub']
except jwt.ExpiredSignatureError:
    print("Token expired")
```

---

## Usage Examples

### Complete CLI Authentication Flow

```python
from auth.cli_auth import (
    AuthContext,
    get_auth_context,
    require_auth
)

# Create admin user
ctx = AuthContext()
ctx.create_user("admin", "admin@example.com", "AdminPass123!", ["admin"])

# Login
token = ctx.login("admin", "AdminPass123!")

# Use protected function
@require_auth
def convert_file(user, input_path, output_path):
    print(f"Converting as {user['username']}")
    # Convert file...
    return True

# Call protected function
convert_file("input.bin", "output.rts.png")
```

### OAuth2 Integration

```python
from auth.oauth2_provider import OAuth2Provider

provider = OAuth2Provider(
    provider_name="google",
    client_id="your-client-id",
    client_secret="your-client-secret",
    authorization_url="https://accounts.google.com/o/oauth2/v2/auth",
    token_url="https://oauth2.googleapis.com/token",
    userinfo_url="https://www.googleapis.com/oauth2/v2/userinfo"
)

# Redirect user to authorization URL
auth_url = provider.get_authorization_url()

# After callback, exchange code for token
tokens = provider.exchange_code_for_token(code)

# Get user info
user_info = provider.get_user_info(tokens['access_token'])
```

### API Key Usage

```python
from auth.apikey_manager import APIKeyManager

manager = APIKeyManager()

# Create key
api_key = manager.create_key(
    user_id="john_doe",
    name="Production Key",
    scopes=["files:read", "files:create"],
    rate_limit=1000
)

# Validate in request
if manager.validate_key(key, secret):
    if manager.check_rate_limit(key):
        # Process request
        pass
```

### Audit Logging

```python
from auth.audit_logger import AuditLogger

logger = AuditLogger()

# Log event
logger.log(
    action="files:create",
    user_id="john_doe",
    resource_id="files:123",
    details={"size": 1024}
)

# Query logs
events = logger.query(user_id="john_doe")

# Export
logger.export_to_json("audit.json")
```

---

For more information, see the [Phase 4 Security Guide](../../systems/pixel_compiler/PHASE4_SECURITY_GUIDE.md) and [Compliance Documentation](compliance.md).
