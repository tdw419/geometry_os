; DESCRIPTION: Renders a purple disk with center (111, 117) and radius 23.
; PLAN: r0=111(x), r1=117(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 117
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
