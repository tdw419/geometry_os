; DESCRIPTION: Places a purple 37x69 rectangle at position (472, 141).
; PLAN: r0=472(x), r1=141(y), r2=37(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 141
LDI r2, 37
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
