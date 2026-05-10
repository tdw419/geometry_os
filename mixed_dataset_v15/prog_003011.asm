; DESCRIPTION: Renders a purple disk with center (144, 149) and radius 50.
; PLAN: r0=144(x), r1=149(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 149
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
