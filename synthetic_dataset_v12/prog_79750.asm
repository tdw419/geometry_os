; DESCRIPTION: Creates a yellow rectangular region at (35, 11) spanning 87 by 43 pixels.
; PLAN: r0=35(x), r1=11(y), r2=87(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 11
LDI r2, 87
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
