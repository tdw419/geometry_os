; DESCRIPTION: Places a magenta dot at position (36, 42).
; PLAN: r0=36(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
