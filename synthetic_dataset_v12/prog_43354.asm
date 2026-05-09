; DESCRIPTION: Creates a magenta rectangular region at (349, 60) spanning 84 by 81 pixels.
; PLAN: r0=349(x), r1=60(y), r2=84(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 60
LDI r2, 84
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
