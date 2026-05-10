; DESCRIPTION: Creates a magenta rectangular region at (312, 194) spanning 78 by 16 pixels.
; PLAN: r0=312(x), r1=194(y), r2=78(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 194
LDI r2, 78
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
