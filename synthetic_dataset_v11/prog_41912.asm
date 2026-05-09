; DESCRIPTION: Creates a red rectangular region at (121, 88) spanning 119 by 41 pixels.
; PLAN: r0=121(x), r1=88(y), r2=119(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 88
LDI r2, 119
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
