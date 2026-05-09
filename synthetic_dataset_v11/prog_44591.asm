; DESCRIPTION: Renders a purple disk with center (65, 92) and radius 50.
; PLAN: r0=65(x), r1=92(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 92
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
