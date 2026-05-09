; DESCRIPTION: Creates a magenta rectangular region at (93, 162) spanning 69 by 35 pixels.
; PLAN: r0=93(x), r1=162(y), r2=69(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 162
LDI r2, 69
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
