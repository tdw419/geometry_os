; DESCRIPTION: Creates a magenta rectangular region at (312, 83) spanning 19 by 108 pixels.
; PLAN: r0=312(x), r1=83(y), r2=19(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 83
LDI r2, 19
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
