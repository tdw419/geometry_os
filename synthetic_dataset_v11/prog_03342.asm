; DESCRIPTION: Creates a yellow rectangular region at (88, 39) spanning 77 by 62 pixels.
; PLAN: r0=88(x), r1=39(y), r2=77(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 39
LDI r2, 77
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
