; DESCRIPTION: Creates a green circular shape at (51, 205) with radius 51.
; PLAN: r0=51(x), r1=205(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 205
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
