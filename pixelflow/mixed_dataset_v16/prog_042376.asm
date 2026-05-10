; DESCRIPTION: Creates a yellow rectangular region at (144, 121) spanning 33 by 115 pixels.
; PLAN: r0=144(x), r1=121(y), r2=33(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 121
LDI r2, 33
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
