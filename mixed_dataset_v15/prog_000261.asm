; DESCRIPTION: Renders a magenta disk with center (428, 138) and radius 76.
; PLAN: r0=428(x), r1=138(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 138
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
