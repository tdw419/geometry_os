; DESCRIPTION: Creates a magenta rectangular region at (381, 34) spanning 116 by 25 pixels.
; PLAN: r0=381(x), r1=34(y), r2=116(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 34
LDI r2, 116
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
