; DESCRIPTION: Creates a magenta rectangular region at (222, 76) spanning 95 by 118 pixels.
; PLAN: r0=222(x), r1=76(y), r2=95(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 76
LDI r2, 95
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
