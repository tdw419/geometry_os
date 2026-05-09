; DESCRIPTION: Creates a green rectangular region at (41, 76) spanning 115 by 100 pixels.
; PLAN: r0=41(x), r1=76(y), r2=115(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 76
LDI r2, 115
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
