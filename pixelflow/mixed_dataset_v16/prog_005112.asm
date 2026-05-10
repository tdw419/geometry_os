; DESCRIPTION: Draws a green circle centered at (125, 129) with radius 78.
; PLAN: r0=125(x), r1=129(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 129
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
