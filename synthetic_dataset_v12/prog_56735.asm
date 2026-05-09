; DESCRIPTION: Creates a yellow rectangular region at (412, 78) spanning 28 by 34 pixels.
; PLAN: r0=412(x), r1=78(y), r2=28(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 78
LDI r2, 28
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
