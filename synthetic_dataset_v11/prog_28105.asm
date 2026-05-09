; DESCRIPTION: Creates a yellow rectangular region at (14, 99) spanning 46 by 116 pixels.
; PLAN: r0=14(x), r1=99(y), r2=46(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 99
LDI r2, 46
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
