; DESCRIPTION: Creates a magenta rectangular region at (23, 145) spanning 99 by 108 pixels.
; PLAN: r0=23(x), r1=145(y), r2=99(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 145
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
