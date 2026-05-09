; DESCRIPTION: Creates a green rectangular region at (33, 53) spanning 78 by 26 pixels.
; PLAN: r0=33(x), r1=53(y), r2=78(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 53
LDI r2, 78
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
