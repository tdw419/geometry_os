; DESCRIPTION: Creates a green rectangular region at (258, 41) spanning 82 by 106 pixels.
; PLAN: r0=258(x), r1=41(y), r2=82(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 41
LDI r2, 82
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
