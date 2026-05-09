; DESCRIPTION: Creates a magenta rectangular region at (88, 50) spanning 14 by 118 pixels.
; PLAN: r0=88(x), r1=50(y), r2=14(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 50
LDI r2, 14
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
