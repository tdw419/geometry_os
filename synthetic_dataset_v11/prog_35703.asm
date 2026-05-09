; DESCRIPTION: Creates a magenta rectangular region at (19, 141) spanning 97 by 49 pixels.
; PLAN: r0=19(x), r1=141(y), r2=97(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 141
LDI r2, 97
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
