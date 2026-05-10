; DESCRIPTION: Creates a vertical green gradient from black to green.
; PLAN: r0=3(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
