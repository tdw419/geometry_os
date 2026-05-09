; DESCRIPTION: Places a magenta dot at position (54, 57).
; PLAN: r0=54(x), r1=57(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 57
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
