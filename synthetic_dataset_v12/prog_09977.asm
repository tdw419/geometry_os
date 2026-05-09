; DESCRIPTION: Creates a yellow rectangular region at (190, 118) spanning 29 by 85 pixels.
; PLAN: r0=190(x), r1=118(y), r2=29(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 118
LDI r2, 29
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
