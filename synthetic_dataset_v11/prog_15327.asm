; DESCRIPTION: Places a orange 80x41 rectangle at position (30, 97).
; PLAN: r0=30(x), r1=97(y), r2=80(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 97
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
