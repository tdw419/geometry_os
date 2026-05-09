; DESCRIPTION: Creates a magenta rectangular region at (65, 56) spanning 118 by 49 pixels.
; PLAN: r0=65(x), r1=56(y), r2=118(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 56
LDI r2, 118
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
