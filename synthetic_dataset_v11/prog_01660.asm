; DESCRIPTION: Creates a magenta rectangular region at (188, 79) spanning 36 by 100 pixels.
; PLAN: r0=188(x), r1=79(y), r2=36(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 79
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
