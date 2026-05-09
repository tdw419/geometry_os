; DESCRIPTION: Draws a green circle centered at (172, 205) with radius 51.
; PLAN: r0=172(x), r1=205(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 205
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
