; DESCRIPTION: Draws a green circle centered at (288, 196) with radius 11.
; PLAN: r0=288(x), r1=196(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 196
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
