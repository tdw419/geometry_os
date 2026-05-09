; DESCRIPTION: Creates a magenta rectangular region at (1, 144) spanning 118 by 28 pixels.
; PLAN: r0=1(x), r1=144(y), r2=118(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 144
LDI r2, 118
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
