; DESCRIPTION: Creates a magenta rectangular region at (312, 43) spanning 39 by 40 pixels.
; PLAN: r0=312(x), r1=43(y), r2=39(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 43
LDI r2, 39
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
