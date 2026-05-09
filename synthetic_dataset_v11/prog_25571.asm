; DESCRIPTION: Renders a purple disk with center (165, 179) and radius 48.
; PLAN: r0=165(x), r1=179(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 179
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
