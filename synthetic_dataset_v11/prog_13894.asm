; DESCRIPTION: Renders a purple disk with center (113, 160) and radius 43.
; PLAN: r0=113(x), r1=160(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 160
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
