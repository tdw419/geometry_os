; DESCRIPTION: Creates a magenta rectangular region at (121, 156) spanning 118 by 80 pixels.
; PLAN: r0=121(x), r1=156(y), r2=118(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 156
LDI r2, 118
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
