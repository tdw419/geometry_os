; DESCRIPTION: Places a blue disk with center (81, 17) and radius 68.
; PLAN: r0=81(x), r1=17(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 17
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
