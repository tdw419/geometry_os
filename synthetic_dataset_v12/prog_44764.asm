; DESCRIPTION: Creates a green rectangular region at (28, 87) spanning 97 by 20 pixels.
; PLAN: r0=28(x), r1=87(y), r2=97(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 87
LDI r2, 97
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
