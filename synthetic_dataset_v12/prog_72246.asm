; DESCRIPTION: Creates a green rectangular region at (96, 21) spanning 97 by 95 pixels.
; PLAN: r0=96(x), r1=21(y), r2=97(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 21
LDI r2, 97
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
