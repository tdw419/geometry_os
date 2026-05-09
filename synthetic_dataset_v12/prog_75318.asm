; DESCRIPTION: Places a blue circle of radius 60 at center (179, 123).
; PLAN: r0=179(x), r1=123(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 123
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
