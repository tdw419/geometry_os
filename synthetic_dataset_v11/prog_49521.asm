; DESCRIPTION: Creates a magenta rectangular region at (33, 23) spanning 118 by 50 pixels.
; PLAN: r0=33(x), r1=23(y), r2=118(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 23
LDI r2, 118
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
