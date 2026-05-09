; DESCRIPTION: Renders a magenta disk with center (198, 170) and radius 66.
; PLAN: r0=198(x), r1=170(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 170
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
