; DESCRIPTION: Places a orange 34x14 rectangle at position (23, 110).
; PLAN: r0=23(x), r1=110(y), r2=34(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 110
LDI r2, 34
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
