; DESCRIPTION: Places a blue circle of radius 48 at center (362, 69).
; PLAN: r0=362(x), r1=69(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 69
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
