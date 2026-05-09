; DESCRIPTION: Places a orange 37x97 rectangle at position (133, 88).
; PLAN: r0=133(x), r1=88(y), r2=37(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 88
LDI r2, 37
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
