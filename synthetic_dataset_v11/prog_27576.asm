; DESCRIPTION: Creates a magenta rectangular region at (212, 79) spanning 37 by 81 pixels.
; PLAN: r0=212(x), r1=79(y), r2=37(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 79
LDI r2, 37
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
