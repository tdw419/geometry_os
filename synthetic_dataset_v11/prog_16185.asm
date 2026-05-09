; DESCRIPTION: Creates a yellow rectangular region at (10, 158) spanning 42 by 66 pixels.
; PLAN: r0=10(x), r1=158(y), r2=42(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 158
LDI r2, 42
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
