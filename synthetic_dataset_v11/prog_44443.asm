; DESCRIPTION: Renders a purple disk with center (111, 159) and radius 31.
; PLAN: r0=111(x), r1=159(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 159
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
