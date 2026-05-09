; DESCRIPTION: Creates a magenta rectangular region at (426, 100) spanning 22 by 83 pixels.
; PLAN: r0=426(x), r1=100(y), r2=22(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 100
LDI r2, 22
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
