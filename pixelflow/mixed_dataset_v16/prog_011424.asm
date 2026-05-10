; DESCRIPTION: Places a blue circle of radius 35 at center (249, 108).
; PLAN: r0=249(x), r1=108(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 108
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
