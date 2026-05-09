; DESCRIPTION: Creates a green rectangular region at (130, 52) spanning 41 by 40 pixels.
; PLAN: r0=130(x), r1=52(y), r2=41(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 52
LDI r2, 41
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
