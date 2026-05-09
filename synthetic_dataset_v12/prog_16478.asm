; DESCRIPTION: Renders a magenta disk with center (428, 119) and radius 39.
; PLAN: r0=428(x), r1=119(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 119
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
