; DESCRIPTION: Places a blue circle of radius 80 at center (100, 172).
; PLAN: r0=100(x), r1=172(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 172
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
