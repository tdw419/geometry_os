; DESCRIPTION: Creates a green rectangular region at (135, 136) spanning 109 by 99 pixels.
; PLAN: r0=135(x), r1=136(y), r2=109(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 136
LDI r2, 109
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
