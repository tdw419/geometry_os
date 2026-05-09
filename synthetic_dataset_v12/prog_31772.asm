; DESCRIPTION: Creates a green rectangular region at (26, 9) spanning 83 by 72 pixels.
; PLAN: r0=26(x), r1=9(y), r2=83(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 9
LDI r2, 83
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
