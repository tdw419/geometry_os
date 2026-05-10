; DESCRIPTION: Renders a blue circular shape at (322, 132) with radius 16.
; PLAN: r0=322(x), r1=132(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 132
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
