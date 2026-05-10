; DESCRIPTION: Creates a green rectangular region at (190, 46) spanning 118 by 96 pixels.
; PLAN: r0=190(x), r1=46(y), r2=118(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 46
LDI r2, 118
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
