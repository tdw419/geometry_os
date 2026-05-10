; DESCRIPTION: Creates a magenta rectangular region at (208, 33) spanning 106 by 118 pixels.
; PLAN: r0=208(x), r1=33(y), r2=106(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 33
LDI r2, 106
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
