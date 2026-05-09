; DESCRIPTION: Creates a green rectangular region at (121, 15) spanning 41 by 80 pixels.
; PLAN: r0=121(x), r1=15(y), r2=41(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 15
LDI r2, 41
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
