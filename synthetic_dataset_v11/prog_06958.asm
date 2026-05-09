; DESCRIPTION: Creates a magenta rectangular region at (212, 73) spanning 15 by 97 pixels.
; PLAN: r0=212(x), r1=73(y), r2=15(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 73
LDI r2, 15
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
