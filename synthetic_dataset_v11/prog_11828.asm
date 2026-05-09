; DESCRIPTION: Creates a green rectangular region at (133, 79) spanning 118 by 94 pixels.
; PLAN: r0=133(x), r1=79(y), r2=118(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 79
LDI r2, 118
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
