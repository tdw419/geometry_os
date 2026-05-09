; DESCRIPTION: Creates a green rectangular region at (75, 160) spanning 14 by 55 pixels.
; PLAN: r0=75(x), r1=160(y), r2=14(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 160
LDI r2, 14
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
