; DESCRIPTION: Creates a magenta rectangular region at (12, 68) spanning 84 by 108 pixels.
; PLAN: r0=12(x), r1=68(y), r2=84(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 68
LDI r2, 84
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
