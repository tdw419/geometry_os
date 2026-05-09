; DESCRIPTION: Creates a magenta rectangular region at (261, 2) spanning 100 by 35 pixels.
; PLAN: r0=261(x), r1=2(y), r2=100(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 2
LDI r2, 100
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
