; DESCRIPTION: Creates a yellow rectangular region at (221, 54) spanning 15 by 108 pixels.
; PLAN: r0=221(x), r1=54(y), r2=15(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 54
LDI r2, 15
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
