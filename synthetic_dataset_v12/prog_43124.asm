; DESCRIPTION: Creates a blue rectangular region at (163, 96) spanning 91 by 118 pixels.
; PLAN: r0=163(x), r1=96(y), r2=91(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 96
LDI r2, 91
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
