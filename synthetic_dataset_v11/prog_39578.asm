; DESCRIPTION: Places a magenta dot at position (122, 225).
; PLAN: r0=122(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
