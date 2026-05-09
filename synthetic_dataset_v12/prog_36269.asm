; DESCRIPTION: Draws a purple circle centered at (420, 129) with radius 26.
; PLAN: r0=420(x), r1=129(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 129
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
