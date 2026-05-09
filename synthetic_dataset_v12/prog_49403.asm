; DESCRIPTION: Creates a yellow rectangular region at (431, 101) spanning 35 by 111 pixels.
; PLAN: r0=431(x), r1=101(y), r2=35(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 101
LDI r2, 35
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
