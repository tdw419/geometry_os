; DESCRIPTION: Places a orange 108x88 rectangle at position (194, 31).
; PLAN: r0=194(x), r1=31(y), r2=108(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 31
LDI r2, 108
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
