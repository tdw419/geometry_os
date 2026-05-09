; DESCRIPTION: Creates a magenta rectangular region at (254, 140) spanning 114 by 29 pixels.
; PLAN: r0=254(x), r1=140(y), r2=114(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 140
LDI r2, 114
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
