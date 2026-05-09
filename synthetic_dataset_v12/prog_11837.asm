; DESCRIPTION: Places a magenta dot at position (86, 255).
; PLAN: r0=86(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
