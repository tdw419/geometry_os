; DESCRIPTION: Creates a magenta rectangular region at (395, 155) spanning 11 by 59 pixels.
; PLAN: r0=395(x), r1=155(y), r2=11(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 155
LDI r2, 11
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
