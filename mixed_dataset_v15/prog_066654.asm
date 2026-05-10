; DESCRIPTION: Creates a magenta rectangular region at (212, 177) spanning 115 by 72 pixels.
; PLAN: r0=212(x), r1=177(y), r2=115(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 177
LDI r2, 115
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
