; DESCRIPTION: Creates a magenta rectangular region at (349, 122) spanning 95 by 44 pixels.
; PLAN: r0=349(x), r1=122(y), r2=95(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 122
LDI r2, 95
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
