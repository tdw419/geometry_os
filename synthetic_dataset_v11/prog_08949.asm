; DESCRIPTION: Renders a purple disk with center (105, 186) and radius 43.
; PLAN: r0=105(x), r1=186(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 186
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
