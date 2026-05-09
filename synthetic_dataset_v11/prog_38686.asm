; DESCRIPTION: Places a purple 75x58 rectangle at position (58, 198).
; PLAN: r0=58(x), r1=198(y), r2=75(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 198
LDI r2, 75
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
