; DESCRIPTION: Renders a magenta disk with center (428, 159) and radius 47.
; PLAN: r0=428(x), r1=159(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 159
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
