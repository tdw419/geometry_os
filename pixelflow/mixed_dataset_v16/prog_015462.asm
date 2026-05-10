; DESCRIPTION: Places a blue dot at position (264, 252).
; PLAN: r0=264(x), r1=252(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 252
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
