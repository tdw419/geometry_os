; DESCRIPTION: Creates a yellow rectangular region at (364, 188) spanning 68 by 22 pixels.
; PLAN: r0=364(x), r1=188(y), r2=68(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 188
LDI r2, 68
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
