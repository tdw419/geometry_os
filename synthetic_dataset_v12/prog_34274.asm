; DESCRIPTION: Creates a magenta rectangular region at (39, 52) spanning 112 by 78 pixels.
; PLAN: r0=39(x), r1=52(y), r2=112(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 52
LDI r2, 112
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
