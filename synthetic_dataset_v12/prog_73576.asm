; DESCRIPTION: Creates a yellow rectangular region at (320, 101) spanning 68 by 43 pixels.
; PLAN: r0=320(x), r1=101(y), r2=68(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 101
LDI r2, 68
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
