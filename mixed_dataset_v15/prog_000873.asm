; DESCRIPTION: Creates a magenta rectangular region at (266, 16) spanning 92 by 79 pixels.
; PLAN: r0=266(x), r1=16(y), r2=92(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 16
LDI r2, 92
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
