; DESCRIPTION: Creates a green rectangular region at (20, 85) spanning 79 by 35 pixels.
; PLAN: r0=20(x), r1=85(y), r2=79(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 85
LDI r2, 79
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
