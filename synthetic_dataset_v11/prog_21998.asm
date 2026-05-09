; DESCRIPTION: Renders a purple disk with center (110, 178) and radius 46.
; PLAN: r0=110(x), r1=178(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 178
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
