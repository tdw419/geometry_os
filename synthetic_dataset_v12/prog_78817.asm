; DESCRIPTION: Places a orange 97x41 rectangle at position (106, 31).
; PLAN: r0=106(x), r1=31(y), r2=97(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 31
LDI r2, 97
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
