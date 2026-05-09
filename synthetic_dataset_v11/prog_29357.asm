; DESCRIPTION: Creates a yellow rectangular region at (111, 115) spanning 101 by 54 pixels.
; PLAN: r0=111(x), r1=115(y), r2=101(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 115
LDI r2, 101
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
