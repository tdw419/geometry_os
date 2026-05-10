; DESCRIPTION: Draws a green circle centered at (374, 45) with radius 21.
; PLAN: r0=374(x), r1=45(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 45
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
