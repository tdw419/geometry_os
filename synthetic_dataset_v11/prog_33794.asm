; DESCRIPTION: Creates a green rectangular region at (162, 212) spanning 25 by 20 pixels.
; PLAN: r0=162(x), r1=212(y), r2=25(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 212
LDI r2, 25
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
