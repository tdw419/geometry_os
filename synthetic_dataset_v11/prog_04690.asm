; DESCRIPTION: Creates a magenta rectangular region at (57, 66) spanning 71 by 88 pixels.
; PLAN: r0=57(x), r1=66(y), r2=71(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 66
LDI r2, 71
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
