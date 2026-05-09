; DESCRIPTION: Places a blue circle of radius 63 at center (161, 70).
; PLAN: r0=161(x), r1=70(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 70
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
