; DESCRIPTION: Creates a magenta rectangular region at (192, 118) spanning 31 by 100 pixels.
; PLAN: r0=192(x), r1=118(y), r2=31(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 118
LDI r2, 31
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
