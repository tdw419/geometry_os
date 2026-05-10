; DESCRIPTION: Creates a magenta rectangular region at (138, 73) spanning 62 by 22 pixels.
; PLAN: r0=138(x), r1=73(y), r2=62(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 73
LDI r2, 62
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
