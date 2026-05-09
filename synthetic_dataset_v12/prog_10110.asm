; DESCRIPTION: Creates a blue rectangular region at (440, 106) spanning 71 by 118 pixels.
; PLAN: r0=440(x), r1=106(y), r2=71(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 106
LDI r2, 71
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
