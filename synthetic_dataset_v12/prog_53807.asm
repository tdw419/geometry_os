; DESCRIPTION: Renders a blue disk with center (328, 175) and radius 51.
; PLAN: r0=328(x), r1=175(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 175
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
