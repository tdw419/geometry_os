; DESCRIPTION: Renders a purple disk with center (443, 49) and radius 32.
; PLAN: r0=443(x), r1=49(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 49
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
