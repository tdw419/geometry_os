; DESCRIPTION: Places a purple 98x12 rectangle at position (278, 62).
; PLAN: r0=278(x), r1=62(y), r2=98(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 62
LDI r2, 98
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
