; DESCRIPTION: Places a blue disk with center (135, 172) and radius 19.
; PLAN: r0=135(x), r1=172(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 172
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
