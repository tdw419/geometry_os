; DESCRIPTION: Creates a magenta rectangular region at (137, 89) spanning 79 by 97 pixels.
; PLAN: r0=137(x), r1=89(y), r2=79(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 89
LDI r2, 79
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
