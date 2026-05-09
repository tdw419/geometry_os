; DESCRIPTION: Places a blue circle of radius 16 at center (100, 98).
; PLAN: r0=100(x), r1=98(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 98
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
