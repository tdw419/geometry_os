; DESCRIPTION: Places a orange 26x97 rectangle at position (25, 66).
; PLAN: r0=25(x), r1=66(y), r2=26(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 66
LDI r2, 26
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
