; DESCRIPTION: Creates a magenta rectangular region at (109, 22) spanning 34 by 13 pixels.
; PLAN: r0=109(x), r1=22(y), r2=34(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 22
LDI r2, 34
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
