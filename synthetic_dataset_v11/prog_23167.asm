; DESCRIPTION: Creates a magenta rectangular region at (137, 70) spanning 79 by 109 pixels.
; PLAN: r0=137(x), r1=70(y), r2=79(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 70
LDI r2, 79
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
