; DESCRIPTION: Places a purple 23x37 rectangle at position (289, 69).
; PLAN: r0=289(x), r1=69(y), r2=23(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 69
LDI r2, 23
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
