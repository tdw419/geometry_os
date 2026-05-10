; DESCRIPTION: Places a purple 117x42 rectangle at position (76, 58).
; PLAN: r0=76(x), r1=58(y), r2=117(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 58
LDI r2, 117
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
