; DESCRIPTION: Creates a green rectangular region at (91, 41) spanning 102 by 76 pixels.
; PLAN: r0=91(x), r1=41(y), r2=102(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 41
LDI r2, 102
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
