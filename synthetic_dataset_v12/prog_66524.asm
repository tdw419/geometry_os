; DESCRIPTION: Creates a blue circular shape at (170, 149) with radius 38.
; PLAN: r0=170(x), r1=149(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 149
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
