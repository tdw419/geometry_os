; DESCRIPTION: Creates a magenta rectangular region at (301, 61) spanning 110 by 97 pixels.
; PLAN: r0=301(x), r1=61(y), r2=110(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 61
LDI r2, 110
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
