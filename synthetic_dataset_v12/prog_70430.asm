; DESCRIPTION: Creates a yellow rectangular region at (141, 80) spanning 101 by 59 pixels.
; PLAN: r0=141(x), r1=80(y), r2=101(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 80
LDI r2, 101
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
