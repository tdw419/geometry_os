; DESCRIPTION: Renders a purple disk with center (111, 50) and radius 47.
; PLAN: r0=111(x), r1=50(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 50
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
