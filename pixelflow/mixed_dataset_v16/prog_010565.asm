; DESCRIPTION: Places a blue 49x58 rectangle at position (122, 97).
; PLAN: r0=122(x), r1=97(y), r2=49(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 97
LDI r2, 49
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
