; DESCRIPTION: Creates a magenta rectangular region at (31, 136) spanning 118 by 103 pixels.
; PLAN: r0=31(x), r1=136(y), r2=118(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 136
LDI r2, 118
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
