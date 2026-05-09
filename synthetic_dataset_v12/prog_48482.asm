; DESCRIPTION: Renders a purple disk with center (295, 89) and radius 20.
; PLAN: r0=295(x), r1=89(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 89
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
