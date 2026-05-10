; DESCRIPTION: Renders a purple disk with center (115, 143) and radius 21.
; PLAN: r0=115(x), r1=143(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 143
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
