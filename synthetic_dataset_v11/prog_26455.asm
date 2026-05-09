; DESCRIPTION: Renders a purple disk with center (82, 85) and radius 14.
; PLAN: r0=82(x), r1=85(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 85
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
