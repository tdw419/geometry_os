; DESCRIPTION: Creates a blue rectangular region at (427, 43) spanning 41 by 102 pixels.
; PLAN: r0=427(x), r1=43(y), r2=41(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 43
LDI r2, 41
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
