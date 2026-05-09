; DESCRIPTION: Renders a purple disk with center (82, 120) and radius 50.
; PLAN: r0=82(x), r1=120(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 120
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
