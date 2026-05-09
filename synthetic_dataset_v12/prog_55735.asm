; DESCRIPTION: Creates a red rectangular region at (13, 22) spanning 97 by 118 pixels.
; PLAN: r0=13(x), r1=22(y), r2=97(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 22
LDI r2, 97
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
