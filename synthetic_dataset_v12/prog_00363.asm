; DESCRIPTION: Creates a magenta rectangular region at (112, 184) spanning 88 by 39 pixels.
; PLAN: r0=112(x), r1=184(y), r2=88(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 184
LDI r2, 88
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
