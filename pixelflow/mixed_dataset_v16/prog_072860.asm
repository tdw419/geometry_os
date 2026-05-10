; DESCRIPTION: Creates a magenta rectangular region at (101, 83) spanning 100 by 57 pixels.
; PLAN: r0=101(x), r1=83(y), r2=100(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 83
LDI r2, 100
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
