; DESCRIPTION: Renders a purple disk with center (389, 168) and radius 54.
; PLAN: r0=389(x), r1=168(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 168
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
