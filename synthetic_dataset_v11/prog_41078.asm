; DESCRIPTION: Creates a green rectangular region at (231, 75) spanning 21 by 66 pixels.
; PLAN: r0=231(x), r1=75(y), r2=21(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 75
LDI r2, 21
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
