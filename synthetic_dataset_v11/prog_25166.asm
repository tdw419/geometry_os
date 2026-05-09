; DESCRIPTION: Renders a purple disk with center (104, 80) and radius 68.
; PLAN: r0=104(x), r1=80(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 80
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
