; DESCRIPTION: Creates a magenta rectangular region at (19, 219) spanning 38 by 14 pixels.
; PLAN: r0=19(x), r1=219(y), r2=38(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 219
LDI r2, 38
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
