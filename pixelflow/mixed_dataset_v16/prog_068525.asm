; DESCRIPTION: Renders a yellow disk with center (217, 157) and radius 70.
; PLAN: r0=217(x), r1=157(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 157
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
