; DESCRIPTION: Renders a purple disk with center (113, 143) and radius 64.
; PLAN: r0=113(x), r1=143(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 143
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
