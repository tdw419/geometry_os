; DESCRIPTION: Creates a magenta rectangular region at (41, 78) spanning 18 by 29 pixels.
; PLAN: r0=41(x), r1=78(y), r2=18(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 78
LDI r2, 18
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
