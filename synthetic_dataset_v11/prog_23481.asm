; DESCRIPTION: Creates a green rectangular region at (136, 146) spanning 118 by 15 pixels.
; PLAN: r0=136(x), r1=146(y), r2=118(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 146
LDI r2, 118
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
