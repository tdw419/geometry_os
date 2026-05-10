; DESCRIPTION: Renders a purple disk with center (252, 153) and radius 59.
; PLAN: r0=252(x), r1=153(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 153
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
