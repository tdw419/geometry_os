; DESCRIPTION: Creates a magenta rectangular region at (38, 62) spanning 51 by 13 pixels.
; PLAN: r0=38(x), r1=62(y), r2=51(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 62
LDI r2, 51
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
