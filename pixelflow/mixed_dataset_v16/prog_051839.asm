; DESCRIPTION: Creates a yellow rectangular region at (145, 123) spanning 21 by 41 pixels.
; PLAN: r0=145(x), r1=123(y), r2=21(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 123
LDI r2, 21
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
