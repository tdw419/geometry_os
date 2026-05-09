; DESCRIPTION: Creates a magenta rectangular region at (265, 2) spanning 57 by 79 pixels.
; PLAN: r0=265(x), r1=2(y), r2=57(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 2
LDI r2, 57
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
