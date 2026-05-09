; DESCRIPTION: Creates a green rectangular region at (5, 40) spanning 72 by 15 pixels.
; PLAN: r0=5(x), r1=40(y), r2=72(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 40
LDI r2, 72
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
