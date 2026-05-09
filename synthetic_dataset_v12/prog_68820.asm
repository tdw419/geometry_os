; DESCRIPTION: Places a orange 88x80 rectangle at position (258, 31).
; PLAN: r0=258(x), r1=31(y), r2=88(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 31
LDI r2, 88
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
