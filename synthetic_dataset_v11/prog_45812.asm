; DESCRIPTION: Places a purple 43x58 rectangle at position (150, 176).
; PLAN: r0=150(x), r1=176(y), r2=43(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 176
LDI r2, 43
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
