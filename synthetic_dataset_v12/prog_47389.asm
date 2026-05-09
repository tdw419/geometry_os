; DESCRIPTION: Places a orange 118x97 rectangle at position (36, 52).
; PLAN: r0=36(x), r1=52(y), r2=118(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 52
LDI r2, 118
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
