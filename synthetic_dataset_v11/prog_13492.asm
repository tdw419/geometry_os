; DESCRIPTION: Creates a blue rectangular region at (72, 14) spanning 118 by 96 pixels.
; PLAN: r0=72(x), r1=14(y), r2=118(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 118
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
