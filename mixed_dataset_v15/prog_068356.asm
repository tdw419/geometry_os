; DESCRIPTION: Creates a magenta rectangular region at (155, 54) spanning 58 by 96 pixels.
; PLAN: r0=155(x), r1=54(y), r2=58(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 54
LDI r2, 58
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
