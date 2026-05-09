; DESCRIPTION: Renders a purple disk with center (459, 206) and radius 36.
; PLAN: r0=459(x), r1=206(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 206
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
