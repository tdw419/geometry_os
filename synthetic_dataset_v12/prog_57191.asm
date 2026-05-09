; DESCRIPTION: Creates a green rectangular region at (35, 101) spanning 83 by 30 pixels.
; PLAN: r0=35(x), r1=101(y), r2=83(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 101
LDI r2, 83
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
