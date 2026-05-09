; DESCRIPTION: Creates a magenta rectangular region at (0, 49) spanning 38 by 54 pixels.
; PLAN: r0=0(x), r1=49(y), r2=38(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 49
LDI r2, 38
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
