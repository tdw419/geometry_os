; DESCRIPTION: Creates a magenta rectangular region at (5, 174) spanning 99 by 79 pixels.
; PLAN: r0=5(x), r1=174(y), r2=99(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 174
LDI r2, 99
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
