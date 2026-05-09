; DESCRIPTION: Creates a magenta rectangular region at (78, 24) spanning 119 by 96 pixels.
; PLAN: r0=78(x), r1=24(y), r2=119(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 24
LDI r2, 119
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
