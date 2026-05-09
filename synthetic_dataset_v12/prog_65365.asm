; DESCRIPTION: Creates a magenta rectangular region at (2, 95) spanning 79 by 71 pixels.
; PLAN: r0=2(x), r1=95(y), r2=79(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 95
LDI r2, 79
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
