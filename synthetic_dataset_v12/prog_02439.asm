; DESCRIPTION: Places a blue circle of radius 69 at center (164, 131).
; PLAN: r0=164(x), r1=131(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 131
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
