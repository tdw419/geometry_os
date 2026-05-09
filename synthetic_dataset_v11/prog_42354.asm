; DESCRIPTION: Renders a yellow disk with center (175, 172) and radius 57.
; PLAN: r0=175(x), r1=172(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 172
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
