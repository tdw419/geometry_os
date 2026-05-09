; DESCRIPTION: Creates a yellow rectangular region at (153, 78) spanning 72 by 87 pixels.
; PLAN: r0=153(x), r1=78(y), r2=72(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 78
LDI r2, 72
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
