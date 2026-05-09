; DESCRIPTION: Renders a purple disk with center (111, 141) and radius 54.
; PLAN: r0=111(x), r1=141(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 141
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
