; DESCRIPTION: Creates a magenta rectangular region at (144, 61) spanning 93 by 118 pixels.
; PLAN: r0=144(x), r1=61(y), r2=93(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 61
LDI r2, 93
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
