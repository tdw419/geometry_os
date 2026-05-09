; DESCRIPTION: Creates a green rectangular region at (118, 225) spanning 41 by 12 pixels.
; PLAN: r0=118(x), r1=225(y), r2=41(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 225
LDI r2, 41
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
