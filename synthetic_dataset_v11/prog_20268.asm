; DESCRIPTION: Creates a green rectangular region at (41, 184) spanning 84 by 38 pixels.
; PLAN: r0=41(x), r1=184(y), r2=84(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 184
LDI r2, 84
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
