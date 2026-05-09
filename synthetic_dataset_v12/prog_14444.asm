; DESCRIPTION: Renders a purple disk with center (347, 164) and radius 26.
; PLAN: r0=347(x), r1=164(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 164
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
