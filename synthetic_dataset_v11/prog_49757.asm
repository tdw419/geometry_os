; DESCRIPTION: Renders a purple disk with center (195, 164) and radius 50.
; PLAN: r0=195(x), r1=164(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 164
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
