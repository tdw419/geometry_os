; DESCRIPTION: Renders a purple disk with center (278, 180) and radius 21.
; PLAN: r0=278(x), r1=180(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 180
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
