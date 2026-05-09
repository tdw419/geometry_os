; DESCRIPTION: Creates a magenta rectangular region at (90, 136) spanning 57 by 118 pixels.
; PLAN: r0=90(x), r1=136(y), r2=57(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 136
LDI r2, 57
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
