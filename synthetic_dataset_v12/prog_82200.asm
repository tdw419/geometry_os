; DESCRIPTION: Places a blue circle of radius 69 at center (103, 104).
; PLAN: r0=103(x), r1=104(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 104
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
