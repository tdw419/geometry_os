; DESCRIPTION: Creates a magenta rectangular region at (273, 102) spanning 101 by 61 pixels.
; PLAN: r0=273(x), r1=102(y), r2=101(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 102
LDI r2, 101
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
