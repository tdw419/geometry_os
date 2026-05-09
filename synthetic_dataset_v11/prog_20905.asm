; DESCRIPTION: Creates a red rectangular region at (41, 159) spanning 88 by 91 pixels.
; PLAN: r0=41(x), r1=159(y), r2=88(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 159
LDI r2, 88
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
