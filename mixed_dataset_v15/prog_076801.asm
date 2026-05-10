; DESCRIPTION: Places a red 85x97 box at position (265, 41).
; PLAN: r0=265(x), r1=41(y), r2=85(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 41
LDI r2, 85
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
