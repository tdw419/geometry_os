; DESCRIPTION: Creates a yellow rectangular region at (88, 4) spanning 69 by 71 pixels.
; PLAN: r0=88(x), r1=4(y), r2=69(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 4
LDI r2, 69
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
