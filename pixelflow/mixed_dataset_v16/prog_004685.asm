; DESCRIPTION: Creates a green rectangular region at (327, 88) spanning 106 by 60 pixels.
; PLAN: r0=327(x), r1=88(y), r2=106(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 88
LDI r2, 106
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
