; DESCRIPTION: Creates a magenta rectangular region at (66, 79) spanning 89 by 96 pixels.
; PLAN: r0=66(x), r1=79(y), r2=89(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 79
LDI r2, 89
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
