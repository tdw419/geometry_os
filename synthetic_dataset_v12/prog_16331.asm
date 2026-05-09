; DESCRIPTION: Creates a magenta rectangular region at (99, 105) spanning 35 by 55 pixels.
; PLAN: r0=99(x), r1=105(y), r2=35(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 105
LDI r2, 35
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
