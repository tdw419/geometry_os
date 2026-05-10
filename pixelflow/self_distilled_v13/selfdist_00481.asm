; DESCRIPTION: Places a blue disk with center (19, 117) and radius 43.
; PLAN: r0=19(x), r1=117(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 117
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
