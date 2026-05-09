; DESCRIPTION: Renders a purple disk with center (80, 143) and radius 63.
; PLAN: r0=80(x), r1=143(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 143
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
