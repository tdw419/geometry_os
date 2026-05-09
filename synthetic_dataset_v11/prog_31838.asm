; DESCRIPTION: Renders a purple disk with center (143, 151) and radius 22.
; PLAN: r0=143(x), r1=151(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 151
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
