; DESCRIPTION: Draws a blue circle centered at (242, 200) with radius 27.
; PLAN: r0=242(x), r1=200(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 200
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
