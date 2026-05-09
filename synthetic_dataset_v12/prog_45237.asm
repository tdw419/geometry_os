; DESCRIPTION: Renders a purple disk with center (165, 206) and radius 30.
; PLAN: r0=165(x), r1=206(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 206
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
