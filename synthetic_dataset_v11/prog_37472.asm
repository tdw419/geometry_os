; DESCRIPTION: Creates a red rectangular region at (96, 123) spanning 21 by 49 pixels.
; PLAN: r0=96(x), r1=123(y), r2=21(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 123
LDI r2, 21
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
