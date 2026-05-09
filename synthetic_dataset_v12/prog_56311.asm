; DESCRIPTION: Creates a yellow rectangular region at (139, 86) spanning 91 by 62 pixels.
; PLAN: r0=139(x), r1=86(y), r2=91(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 86
LDI r2, 91
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
