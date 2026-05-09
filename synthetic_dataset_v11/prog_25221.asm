; DESCRIPTION: Creates a magenta rectangular region at (187, 49) spanning 69 by 81 pixels.
; PLAN: r0=187(x), r1=49(y), r2=69(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 49
LDI r2, 69
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
