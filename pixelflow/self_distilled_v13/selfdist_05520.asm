; DESCRIPTION: Places a magenta dot at position (303, 24).
; PLAN: r0=303(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 24
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
