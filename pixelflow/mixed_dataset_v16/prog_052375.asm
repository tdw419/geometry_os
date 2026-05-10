; DESCRIPTION: Renders a purple disk with center (406, 120) and radius 38.
; PLAN: r0=406(x), r1=120(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 120
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
