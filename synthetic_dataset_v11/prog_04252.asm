; DESCRIPTION: Places a orange 14x62 rectangle at position (98, 88).
; PLAN: r0=98(x), r1=88(y), r2=14(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 88
LDI r2, 14
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
