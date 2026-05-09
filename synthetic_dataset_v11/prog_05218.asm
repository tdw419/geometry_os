; DESCRIPTION: Creates a magenta rectangular region at (163, 26) spanning 20 by 99 pixels.
; PLAN: r0=163(x), r1=26(y), r2=20(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 26
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
