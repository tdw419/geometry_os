; DESCRIPTION: Creates a magenta rectangular region at (41, 41) spanning 97 by 118 pixels.
; PLAN: r0=41(x), r1=41(y), r2=97(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 97
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
