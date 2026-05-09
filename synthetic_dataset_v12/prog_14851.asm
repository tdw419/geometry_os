; DESCRIPTION: Creates a green rectangular region at (89, 65) spanning 86 by 41 pixels.
; PLAN: r0=89(x), r1=65(y), r2=86(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 65
LDI r2, 86
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
