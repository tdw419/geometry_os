; DESCRIPTION: Creates a yellow rectangular region at (41, 9) spanning 90 by 20 pixels.
; PLAN: r0=41(x), r1=9(y), r2=90(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 9
LDI r2, 90
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
