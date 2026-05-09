; DESCRIPTION: Creates a magenta rectangular region at (179, 100) spanning 43 by 92 pixels.
; PLAN: r0=179(x), r1=100(y), r2=43(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 100
LDI r2, 43
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
