; DESCRIPTION: Places a blue 110x101 rectangle at position (49, 108).
; PLAN: r0=49(x), r1=108(y), r2=110(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 108
LDI r2, 110
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
