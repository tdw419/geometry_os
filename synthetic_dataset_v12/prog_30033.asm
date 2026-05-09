; DESCRIPTION: Creates a blue rectangular region at (132, 121) spanning 26 by 41 pixels.
; PLAN: r0=132(x), r1=121(y), r2=26(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 121
LDI r2, 26
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
