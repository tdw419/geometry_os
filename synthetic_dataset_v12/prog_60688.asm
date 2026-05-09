; DESCRIPTION: Creates a magenta rectangular region at (351, 158) spanning 118 by 18 pixels.
; PLAN: r0=351(x), r1=158(y), r2=118(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 158
LDI r2, 118
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
