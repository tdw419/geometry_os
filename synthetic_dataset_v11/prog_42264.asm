; DESCRIPTION: Creates a green rectangular region at (55, 24) spanning 90 by 69 pixels.
; PLAN: r0=55(x), r1=24(y), r2=90(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 24
LDI r2, 90
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
