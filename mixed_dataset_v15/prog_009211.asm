; DESCRIPTION: Creates a green rectangular region at (75, 84) spanning 95 by 104 pixels.
; PLAN: r0=75(x), r1=84(y), r2=95(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 84
LDI r2, 95
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
