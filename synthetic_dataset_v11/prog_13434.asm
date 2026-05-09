; DESCRIPTION: Creates a yellow rectangular region at (26, 43) spanning 86 by 46 pixels.
; PLAN: r0=26(x), r1=43(y), r2=86(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 43
LDI r2, 86
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
