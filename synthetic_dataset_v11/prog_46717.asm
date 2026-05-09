; DESCRIPTION: Creates a orange rectangular region at (158, 136) spanning 28 by 41 pixels.
; PLAN: r0=158(x), r1=136(y), r2=28(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 136
LDI r2, 28
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
