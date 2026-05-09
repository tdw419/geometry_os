; DESCRIPTION: Creates a red rectangular region at (247, 123) spanning 88 by 48 pixels.
; PLAN: r0=247(x), r1=123(y), r2=88(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 123
LDI r2, 88
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
