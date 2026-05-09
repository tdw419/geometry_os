; DESCRIPTION: Renders a magenta disk with center (366, 78) and radius 78.
; PLAN: r0=366(x), r1=78(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 78
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
