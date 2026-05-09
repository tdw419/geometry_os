; DESCRIPTION: Creates a green rectangular region at (335, 127) spanning 69 by 83 pixels.
; PLAN: r0=335(x), r1=127(y), r2=69(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 127
LDI r2, 69
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
