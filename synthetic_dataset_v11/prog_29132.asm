; DESCRIPTION: Creates a magenta rectangular region at (142, 34) spanning 102 by 69 pixels.
; PLAN: r0=142(x), r1=34(y), r2=102(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 34
LDI r2, 102
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
