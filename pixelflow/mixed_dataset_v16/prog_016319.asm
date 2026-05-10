; DESCRIPTION: Creates a green rectangular region at (430, 22) spanning 41 by 120 pixels.
; PLAN: r0=430(x), r1=22(y), r2=41(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 22
LDI r2, 41
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
