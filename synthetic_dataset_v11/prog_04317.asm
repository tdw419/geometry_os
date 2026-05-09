; DESCRIPTION: Creates a yellow rectangular region at (81, 135) spanning 101 by 115 pixels.
; PLAN: r0=81(x), r1=135(y), r2=101(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 135
LDI r2, 101
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
