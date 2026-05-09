; DESCRIPTION: Creates a magenta rectangular region at (118, 1) spanning 53 by 54 pixels.
; PLAN: r0=118(x), r1=1(y), r2=53(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 1
LDI r2, 53
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
