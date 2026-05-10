; DESCRIPTION: Creates a magenta rectangular region at (174, 84) spanning 108 by 88 pixels.
; PLAN: r0=174(x), r1=84(y), r2=108(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 84
LDI r2, 108
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
