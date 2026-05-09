; DESCRIPTION: Creates a yellow rectangular region at (158, 114) spanning 42 by 88 pixels.
; PLAN: r0=158(x), r1=114(y), r2=42(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 114
LDI r2, 42
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
