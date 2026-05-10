; DESCRIPTION: Renders a yellow disk with center (416, 175) and radius 52.
; PLAN: r0=416(x), r1=175(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 175
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
