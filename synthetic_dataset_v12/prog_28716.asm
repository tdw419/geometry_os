; DESCRIPTION: Renders a purple disk with center (340, 176) and radius 50.
; PLAN: r0=340(x), r1=176(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 176
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
