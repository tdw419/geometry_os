; DESCRIPTION: Creates a yellow rectangular region at (38, 94) spanning 101 by 102 pixels.
; PLAN: r0=38(x), r1=94(y), r2=101(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 94
LDI r2, 101
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
