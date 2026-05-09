; DESCRIPTION: Creates a magenta rectangular region at (91, 181) spanning 119 by 74 pixels.
; PLAN: r0=91(x), r1=181(y), r2=119(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 181
LDI r2, 119
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
