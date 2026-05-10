; DESCRIPTION: Creates a magenta rectangular region at (14, 75) spanning 54 by 47 pixels.
; PLAN: r0=14(x), r1=75(y), r2=54(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 75
LDI r2, 54
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
