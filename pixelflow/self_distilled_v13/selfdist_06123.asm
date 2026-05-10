; DESCRIPTION: Places a orange 91x68 box at position (31, 52).
; PLAN: r0=31(x), r1=52(y), r2=91(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 52
LDI r2, 91
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
