; DESCRIPTION: Creates a yellow rectangular region at (411, 81) spanning 59 by 88 pixels.
; PLAN: r0=411(x), r1=81(y), r2=59(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 81
LDI r2, 59
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
