; DESCRIPTION: Creates a magenta rectangular region at (97, 93) spanning 104 by 118 pixels.
; PLAN: r0=97(x), r1=93(y), r2=104(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 93
LDI r2, 104
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
