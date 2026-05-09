; DESCRIPTION: Creates a green rectangular region at (28, 188) spanning 102 by 43 pixels.
; PLAN: r0=28(x), r1=188(y), r2=102(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 188
LDI r2, 102
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
