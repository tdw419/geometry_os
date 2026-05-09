; DESCRIPTION: Creates a magenta rectangular region at (124, 49) spanning 47 by 114 pixels.
; PLAN: r0=124(x), r1=49(y), r2=47(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 49
LDI r2, 47
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
