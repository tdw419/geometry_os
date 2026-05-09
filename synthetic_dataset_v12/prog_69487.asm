; DESCRIPTION: Creates a magenta rectangular region at (358, 53) spanning 100 by 106 pixels.
; PLAN: r0=358(x), r1=53(y), r2=100(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 53
LDI r2, 100
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
