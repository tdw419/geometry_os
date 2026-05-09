; DESCRIPTION: Renders a purple disk with center (303, 111) and radius 58.
; PLAN: r0=303(x), r1=111(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 111
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
