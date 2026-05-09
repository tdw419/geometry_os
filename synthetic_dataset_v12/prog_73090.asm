; DESCRIPTION: Creates a green rectangular region at (41, 72) spanning 28 by 22 pixels.
; PLAN: r0=41(x), r1=72(y), r2=28(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 72
LDI r2, 28
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
