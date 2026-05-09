; DESCRIPTION: Renders a purple disk with center (308, 120) and radius 71.
; PLAN: r0=308(x), r1=120(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 120
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
