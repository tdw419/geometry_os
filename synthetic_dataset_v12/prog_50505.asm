; DESCRIPTION: Creates a green rectangular region at (472, 108) spanning 30 by 48 pixels.
; PLAN: r0=472(x), r1=108(y), r2=30(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 108
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
