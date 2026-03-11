"""
Native Glyph Shell - Internationalization (i18n) Module

Provides localization support for the Native Glyph Shell with:
- Multiple language support
- Locale detection
- Fallback to English for missing translations
- Plural forms support
- RTL language support

Usage:
    from geoasm_cli.i18n import set_locale, t, _
    
    # Set locale
    set_locale('es')
    
    # Get translation
    message = t('errors.file_not_found', file='test.geoasm')
    # => "El archivo 'test.geoasm' no se encuentra"
    
    # Shorthand
    message = _('welcome.message')
"""

import os
import json
import locale
from pathlib import Path
from typing import Dict, Optional, Any
from dataclasses import dataclass, field

# Default locale directory
_LOCALE_DIR = Path(__file__).parent / "locales"

# Supported languages with their metadata
SUPPORTED_LANGUAGES = {
    "en": {"name": "English", "native": "English", "rtl": False, "fallback": None},
    "es": {"name": "Spanish", "native": "Español", "rtl": False, "fallback": "en"},
    "fr": {"name": "French", "native": "Français", "rtl": False, "fallback": "en"},
    "de": {"name": "German", "native": "Deutsch", "rtl": False, "fallback": "en"},
    "ja": {"name": "Japanese", "native": "日本語", "rtl": False, "fallback": "en"},
    "zh": {"name": "Chinese", "native": "中文", "rtl": False, "fallback": "en"},
    "pt": {"name": "Portuguese", "native": "Português", "rtl": False, "fallback": "en"},
    "ru": {"name": "Russian", "native": "Русский", "rtl": False, "fallback": "en"},
    "ko": {"name": "Korean", "native": "한국어", "rtl": False, "fallback": "en"},
    "ar": {"name": "Arabic", "native": "العربية", "rtl": True, "fallback": "en"},
    "hi": {"name": "Hindi", "native": "हिन्दी", "rtl": False, "fallback": "en"},
    "it": {"name": "Italian", "native": "Italiano", "rtl": False, "fallback": "en"},
    "nl": {"name": "Dutch", "native": "Nederlands", "rtl": False, "fallback": "en"},
    "pl": {"name": "Polish", "native": "Polski", "rtl": False, "fallback": "en"},
    "tr": {"name": "Turkish", "native": "Türkçe", "rtl": False, "fallback": "en"},
    "vi": {"name": "Vietnamese", "native": "Tiếng Việt", "rtl": False, "fallback": "en"},
    "th": {"name": "Thai", "native": "ไทย", "rtl": False, "fallback": "en"},
    "id": {"name": "Indonesian", "native": "Bahasa Indonesia", "rtl": False, "fallback": "en"},
}


@dataclass
class LocaleConfig:
    """Configuration for the current locale."""
    language: str = "en"
    translations: Dict[str, Any] = field(default_factory=dict)
    rtl: bool = False
    
    def is_rtl(self) -> bool:
        """Check if the current locale is right-to-left."""
        return self.rtl


# Global locale configuration
_current_locale = LocaleConfig()


def detect_system_locale() -> str:
    """
    Detect the system's preferred locale.
    
    Returns:
        Two-letter language code (e.g., 'en', 'es', 'fr')
    """
    # Check environment variables first
    for env_var in ['GEOASM_LOCALE', 'LANG', 'LANGUAGE', 'LC_ALL', 'LC_MESSAGES']:
        env_val = os.environ.get(env_var, '')
        if env_val:
            # Extract language code (e.g., 'en_US.UTF-8' -> 'en')
            lang_code = env_val.split('_')[0].split('.')[0].lower()
            if lang_code in SUPPORTED_LANGUAGES:
                return lang_code
    
    # Try Python's locale module
    try:
        sys_locale = locale.getdefaultlocale()[0]
        if sys_locale:
            lang_code = sys_locale.split('_')[0].lower()
            if lang_code in SUPPORTED_LANGUAGES:
                return lang_code
    except (ValueError, TypeError):
        pass
    
    # Default to English
    return "en"


def load_translations(lang_code: str) -> Dict[str, Any]:
    """
    Load translations for a given language.
    
    Args:
        lang_code: Two-letter language code (e.g., 'en', 'es')
    
    Returns:
        Dictionary of translations (nested structure)
    """
    translation_file = _LOCALE_DIR / f"{lang_code}.json"
    
    if not translation_file.exists():
        # Try fallback language
        lang_info = SUPPORTED_LANGUAGES.get(lang_code, {})
        fallback = lang_info.get("fallback")
        if fallback and fallback != lang_code:
            return load_translations(fallback)
        return {}
    
    try:
        with open(translation_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError) as e:
        # Log error but don't crash
        import warnings
        warnings.warn(f"Failed to load translations for {lang_code}: {e}")
        return {}


def set_locale(lang_code: str) -> bool:
    """
    Set the current locale for translations.
    
    Args:
        lang_code: Two-letter language code (e.g., 'en', 'es', 'ja')
    
    Returns:
        True if locale was set successfully, False otherwise
    
    Example:
        >>> set_locale('es')
        True
        >>> t('greeting')
        'Hola'
    """
    global _current_locale
    
    # Normalize language code
    lang_code = lang_code.lower().strip()
    
    # Handle locale strings like 'en_US' or 'en-US'
    if '_' in lang_code or '-' in lang_code:
        lang_code = lang_code.replace('-', '_').split('_')[0]
    
    # Check if language is supported
    if lang_code not in SUPPORTED_LANGUAGES:
        # Try to find a close match
        supported_codes = list(SUPPORTED_LANGUAGES.keys())
        for code in supported_codes:
            if code.startswith(lang_code[:2]):
                lang_code = code
                break
        else:
            # Fall back to English
            lang_code = "en"
    
    # Load translations
    translations = load_translations(lang_code)
    
    # Update locale config
    lang_info = SUPPORTED_LANGUAGES.get(lang_code, {})
    _current_locale = LocaleConfig(
        language=lang_code,
        translations=translations,
        rtl=lang_info.get("rtl", False)
    )
    
    return True


def get_current_locale() -> str:
    """
    Get the current locale code.
    
    Returns:
        Two-letter language code (e.g., 'en', 'es')
    """
    return _current_locale.language


def get_translations() -> Dict[str, Any]:
    """
    Get all translations for the current locale.
    
    Returns:
        Dictionary of translations
    """
    return _current_locale.translations


def _get_nested_value(data: Dict[str, Any], key_path: str) -> Optional[str]:
    """
    Get a nested value from a dictionary using dot notation.
    
    Args:
        data: Nested dictionary
        key_path: Dot-separated key path (e.g., 'errors.file_not_found')
    
    Returns:
        The value if found, None otherwise
    """
    keys = key_path.split('.')
    value = data
    
    for key in keys:
        if isinstance(value, dict) and key in value:
            value = value[key]
        else:
            return None
    
    return value if isinstance(value, str) else None


def t(key: str, default: str = None, **kwargs) -> str:
    """
    Translate a key to the current locale.
    
    Args:
        key: Translation key (dot notation, e.g., 'errors.file_not_found')
        default: Default text if translation not found (defaults to key)
        **kwargs: Format variables for string interpolation
    
    Returns:
        Translated and formatted string
    
    Example:
        >>> set_locale('es')
        >>> t('errors.file_not_found', file='test.geoasm')
        "El archivo 'test.geoasm' no se encuentra"
    """
    # Try to get translation
    translation = _get_nested_value(_current_locale.translations, key)
    
    if translation is None:
        # Try English as fallback
        if _current_locale.language != "en":
            en_translations = load_translations("en")
            translation = _get_nested_value(en_translations, key)
    
    if translation is None:
        # Use default or key
        translation = default if default is not None else key
    
    # Format with kwargs if provided
    if kwargs and isinstance(translation, str):
        try:
            return translation.format(**kwargs)
        except KeyError as e:
            # Missing format variable, return unformatted
            import warnings
            warnings.warn(f"Missing format variable {e} for key '{key}'")
            return translation
    
    return translation


def _(key: str, default: str = None, **kwargs) -> str:
    """
    Shorthand for t() - translate a key to the current locale.
    
    Args:
        key: Translation key
        default: Default text if translation not found
        **kwargs: Format variables
    
    Returns:
        Translated string
    """
    return t(key, default, **kwargs)


def tn(key_singular: str, key_plural: str, count: int, **kwargs) -> str:
    """
    Translate with plural form support.
    
    Args:
        key_singular: Translation key for singular form
        key_plural: Translation key for plural form
        count: Count to determine singular/plural
        **kwargs: Format variables (count is automatically included)
    
    Returns:
        Translated string with correct plural form
    
    Example:
        >>> set_locale('en')
        >>> tn('item.count_one', 'item.count_other', 5)
        "5 items"
    """
    if count == 1:
        return t(key_singular, count=count, **kwargs)
    else:
        return t(key_plural, count=count, **kwargs)


def get_supported_languages() -> Dict[str, Dict[str, Any]]:
    """
    Get all supported languages with their metadata.
    
    Returns:
        Dictionary of language codes to language info
    """
    return SUPPORTED_LANGUAGES.copy()


def is_rtl() -> bool:
    """
    Check if the current locale uses right-to-left text direction.
    
    Returns:
        True if RTL, False if LTR
    """
    return _current_locale.is_rtl()


# Initialize with system locale on module load
def _init():
    """Initialize the i18n module with system locale."""
    system_lang = detect_system_locale()
    set_locale(system_lang)


_init()
