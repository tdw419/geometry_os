; DESCRIPTION: Creates a green rectangular region at (100, 174) spanning 35 by 28 pixels.
; PLAN: r0=100(x), r1=174(y), r2=35(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 174
LDI r2, 35
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
