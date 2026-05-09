; DESCRIPTION: Creates a green rectangular region at (217, 35) spanning 30 by 88 pixels.
; PLAN: r0=217(x), r1=35(y), r2=30(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 35
LDI r2, 30
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
