; DESCRIPTION: Creates a magenta rectangular region at (225, 145) spanning 35 by 11 pixels.
; PLAN: r0=225(x), r1=145(y), r2=35(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 145
LDI r2, 35
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
