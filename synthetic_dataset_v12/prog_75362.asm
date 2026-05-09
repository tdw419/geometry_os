; DESCRIPTION: Draws a green circle centered at (237, 150) with radius 20.
; PLAN: r0=237(x), r1=150(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 150
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
