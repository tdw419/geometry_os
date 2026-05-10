; DESCRIPTION: Creates a magenta rectangular region at (157, 89) spanning 17 by 79 pixels.
; PLAN: r0=157(x), r1=89(y), r2=17(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 89
LDI r2, 17
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
