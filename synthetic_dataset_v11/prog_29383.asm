; DESCRIPTION: Creates a magenta rectangular region at (73, 80) spanning 79 by 102 pixels.
; PLAN: r0=73(x), r1=80(y), r2=79(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 80
LDI r2, 79
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
