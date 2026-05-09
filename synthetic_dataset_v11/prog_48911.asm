; DESCRIPTION: Creates a red rectangular region at (37, 22) spanning 117 by 110 pixels.
; PLAN: r0=37(x), r1=22(y), r2=117(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 22
LDI r2, 117
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
