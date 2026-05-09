; DESCRIPTION: Places a magenta dot at position (455, 54).
; PLAN: r0=455(x), r1=54(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 54
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
