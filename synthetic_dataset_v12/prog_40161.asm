; DESCRIPTION: Creates a magenta rectangular region at (299, 73) spanning 112 by 118 pixels.
; PLAN: r0=299(x), r1=73(y), r2=112(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 73
LDI r2, 112
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
