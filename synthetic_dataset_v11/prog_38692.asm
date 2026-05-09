; DESCRIPTION: Creates a magenta rectangular region at (138, 160) spanning 114 by 70 pixels.
; PLAN: r0=138(x), r1=160(y), r2=114(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 160
LDI r2, 114
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
