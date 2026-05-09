; DESCRIPTION: Creates a magenta rectangular region at (62, 108) spanning 67 by 106 pixels.
; PLAN: r0=62(x), r1=108(y), r2=67(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 108
LDI r2, 67
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
