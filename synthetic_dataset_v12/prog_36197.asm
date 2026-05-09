; DESCRIPTION: Creates a magenta rectangular region at (341, 133) spanning 73 by 37 pixels.
; PLAN: r0=341(x), r1=133(y), r2=73(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 133
LDI r2, 73
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
