; DESCRIPTION: Creates a green rectangular region at (86, 158) spanning 57 by 73 pixels.
; PLAN: r0=86(x), r1=158(y), r2=57(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 158
LDI r2, 57
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
