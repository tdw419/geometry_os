; DESCRIPTION: Places a orange 34x31 rectangle at position (89, 54).
; PLAN: r0=89(x), r1=54(y), r2=34(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 54
LDI r2, 34
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
