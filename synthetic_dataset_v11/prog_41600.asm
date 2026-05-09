; DESCRIPTION: Creates a green rectangular region at (101, 26) spanning 43 by 54 pixels.
; PLAN: r0=101(x), r1=26(y), r2=43(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 26
LDI r2, 43
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
