; DESCRIPTION: Creates a green rectangular region at (310, 102) spanning 108 by 102 pixels.
; PLAN: r0=310(x), r1=102(y), r2=108(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 102
LDI r2, 108
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
