; DESCRIPTION: Places a orange 34x21 rectangle at position (370, 26).
; PLAN: r0=370(x), r1=26(y), r2=34(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 26
LDI r2, 34
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
