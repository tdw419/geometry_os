; DESCRIPTION: Creates a green rectangular region at (101, 62) spanning 71 by 13 pixels.
; PLAN: r0=101(x), r1=62(y), r2=71(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 62
LDI r2, 71
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
