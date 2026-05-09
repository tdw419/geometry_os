; DESCRIPTION: Creates a magenta rectangular region at (5, 119) spanning 29 by 99 pixels.
; PLAN: r0=5(x), r1=119(y), r2=29(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 119
LDI r2, 29
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
