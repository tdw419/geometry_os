; DESCRIPTION: Creates a green rectangular region at (140, 122) spanning 12 by 55 pixels.
; PLAN: r0=140(x), r1=122(y), r2=12(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 122
LDI r2, 12
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
