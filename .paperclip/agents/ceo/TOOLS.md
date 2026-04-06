# CEO Agent -- TOOLS.md

_Capability manifest. You have access to these tools._

## Paperclip API (via curl)
- `GET /api/companies/{id}/issues` -- list all issues
- `GET /api/issues/{id}` -- read issue details
- `POST /api/companies/{id}/issues` -- create new issues
- `PATCH /api/issues/{id}` -- update issue (status, assignee, priority, body)
- `POST /api/issues/{id}/comments` -- comment on issues
- `GET /api/companies/{id}/agents` -- list agents
- `GET /api/companies/{id}/routines` -- list routines
- `POST /api/routines/{id}/run` -- trigger routine execution

## File System (read-only for roadmap)
- `ROADMAP.md` -- read to sync with issue board
- `.paperclip/agents/*/` -- read agent identities to understand capabilities

## Boundaries
- DO NOT write code or modify source files.
- DO NOT run tests or build commands.
- DO NOT modify MEMORY.md for other agents.
- Focus on planning, not execution.
