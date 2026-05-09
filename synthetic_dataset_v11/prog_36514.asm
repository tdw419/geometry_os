; DESCRIPTION: Creates a green rectangular region at (145, 76) spanning 23 by 41 pixels.
; PLAN: r0=145(x), r1=76(y), r2=23(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 76
LDI r2, 23
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
