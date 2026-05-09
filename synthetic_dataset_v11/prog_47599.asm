; DESCRIPTION: Draws a blue circle centered at (103, 129) with radius 80.
; PLAN: r0=103(x), r1=129(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 129
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
