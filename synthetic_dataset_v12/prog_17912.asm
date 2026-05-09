; DESCRIPTION: Creates a red rectangular region at (325, 123) spanning 106 by 81 pixels.
; PLAN: r0=325(x), r1=123(y), r2=106(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 123
LDI r2, 106
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
