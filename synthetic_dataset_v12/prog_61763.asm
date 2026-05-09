; DESCRIPTION: Creates a magenta rectangular region at (151, 92) spanning 74 by 106 pixels.
; PLAN: r0=151(x), r1=92(y), r2=74(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 92
LDI r2, 74
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
