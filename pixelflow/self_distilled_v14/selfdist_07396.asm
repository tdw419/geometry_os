; DESCRIPTION: Creates a magenta filled rectangle of size 19x78 starting at (244, 155).
; PLAN: r0=244(x), r1=155(y), r2=19(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 155
LDI r2, 19
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
