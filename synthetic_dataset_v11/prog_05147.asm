; DESCRIPTION: Creates a yellow rectangular region at (62, 41) spanning 117 by 56 pixels.
; PLAN: r0=62(x), r1=41(y), r2=117(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 41
LDI r2, 117
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
