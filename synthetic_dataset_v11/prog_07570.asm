; DESCRIPTION: Places a orange 85x118 rectangle at position (14, 34).
; PLAN: r0=14(x), r1=34(y), r2=85(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 34
LDI r2, 85
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
