; DESCRIPTION: Creates a green rectangular region at (88, 62) spanning 43 by 98 pixels.
; PLAN: r0=88(x), r1=62(y), r2=43(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 62
LDI r2, 43
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
