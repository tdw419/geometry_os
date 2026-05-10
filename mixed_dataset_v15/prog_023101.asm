; DESCRIPTION: Creates a magenta rectangular region at (132, 95) spanning 73 by 108 pixels.
; PLAN: r0=132(x), r1=95(y), r2=73(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 95
LDI r2, 73
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
