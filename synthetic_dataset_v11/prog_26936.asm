; DESCRIPTION: Creates a magenta rectangular region at (100, 14) spanning 47 by 40 pixels.
; PLAN: r0=100(x), r1=14(y), r2=47(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 14
LDI r2, 47
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
