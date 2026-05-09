; DESCRIPTION: Creates a magenta rectangular region at (34, 198) spanning 99 by 11 pixels.
; PLAN: r0=34(x), r1=198(y), r2=99(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 198
LDI r2, 99
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
