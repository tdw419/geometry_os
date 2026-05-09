; DESCRIPTION: Creates a magenta rectangular region at (80, 26) spanning 114 by 88 pixels.
; PLAN: r0=80(x), r1=26(y), r2=114(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 26
LDI r2, 114
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
