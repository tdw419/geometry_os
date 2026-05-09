; DESCRIPTION: Creates a magenta rectangular region at (41, 91) spanning 118 by 75 pixels.
; PLAN: r0=41(x), r1=91(y), r2=118(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 91
LDI r2, 118
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
