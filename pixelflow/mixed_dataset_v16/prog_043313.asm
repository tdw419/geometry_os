; DESCRIPTION: Draws a white circle centered at (84, 129) with radius 80.
; PLAN: r0=84(x), r1=129(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 129
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
