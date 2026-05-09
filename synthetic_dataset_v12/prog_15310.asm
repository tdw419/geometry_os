; DESCRIPTION: Creates a magenta rectangular region at (93, 70) spanning 119 by 62 pixels.
; PLAN: r0=93(x), r1=70(y), r2=119(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 70
LDI r2, 119
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
