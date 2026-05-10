; DESCRIPTION: Creates a yellow rectangular region at (311, 207) spanning 38 by 41 pixels.
; PLAN: r0=311(x), r1=207(y), r2=38(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 207
LDI r2, 38
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
