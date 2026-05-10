; DESCRIPTION: Renders a purple disk with center (59, 53) and radius 23.
; PLAN: r0=59(x), r1=53(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 53
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
