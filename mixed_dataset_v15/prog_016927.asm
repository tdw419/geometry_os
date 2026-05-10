; DESCRIPTION: Creates a green rectangular region at (350, 30) spanning 106 by 74 pixels.
; PLAN: r0=350(x), r1=30(y), r2=106(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 30
LDI r2, 106
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
