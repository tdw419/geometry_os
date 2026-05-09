; DESCRIPTION: Creates a yellow rectangular region at (160, 155) spanning 81 by 41 pixels.
; PLAN: r0=160(x), r1=155(y), r2=81(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 155
LDI r2, 81
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
