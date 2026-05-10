; DESCRIPTION: Places a purple 20x108 rectangle at position (452, 7).
; PLAN: r0=452(x), r1=7(y), r2=20(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 7
LDI r2, 20
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
