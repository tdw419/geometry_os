; DESCRIPTION: Creates a yellow rectangular region at (395, 172) spanning 88 by 71 pixels.
; PLAN: r0=395(x), r1=172(y), r2=88(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 172
LDI r2, 88
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
