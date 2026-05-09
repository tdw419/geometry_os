; DESCRIPTION: Places a purple 80x30 rectangle at position (115, 62).
; PLAN: r0=115(x), r1=62(y), r2=80(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 62
LDI r2, 80
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
