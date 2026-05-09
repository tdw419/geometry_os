; DESCRIPTION: Places a orange 108x97 rectangle at position (23, 118).
; PLAN: r0=23(x), r1=118(y), r2=108(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 118
LDI r2, 108
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
