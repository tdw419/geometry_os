; DESCRIPTION: Creates a yellow rectangular region at (203, 15) spanning 43 by 68 pixels.
; PLAN: r0=203(x), r1=15(y), r2=43(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 15
LDI r2, 43
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
