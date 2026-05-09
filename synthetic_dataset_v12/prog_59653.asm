; DESCRIPTION: Places a purple 50x75 rectangle at position (390, 88).
; PLAN: r0=390(x), r1=88(y), r2=50(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 88
LDI r2, 50
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
