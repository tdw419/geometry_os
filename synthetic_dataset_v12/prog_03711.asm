; DESCRIPTION: Creates a green rectangular region at (69, 155) spanning 18 by 55 pixels.
; PLAN: r0=69(x), r1=155(y), r2=18(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 155
LDI r2, 18
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
