; DESCRIPTION: Creates a magenta rectangular region at (11, 3) spanning 108 by 84 pixels.
; PLAN: r0=11(x), r1=3(y), r2=108(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 108
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
