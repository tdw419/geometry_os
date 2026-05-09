; DESCRIPTION: Creates a green rectangular region at (164, 144) spanning 84 by 87 pixels.
; PLAN: r0=164(x), r1=144(y), r2=84(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 144
LDI r2, 84
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
