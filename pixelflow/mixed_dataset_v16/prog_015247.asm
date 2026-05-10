; DESCRIPTION: Places a magenta dot at position (42, 197).
; PLAN: r0=42(x), r1=197(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 197
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
