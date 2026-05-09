; DESCRIPTION: Creates a green rectangular region at (81, 144) spanning 75 by 14 pixels.
; PLAN: r0=81(x), r1=144(y), r2=75(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 144
LDI r2, 75
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
