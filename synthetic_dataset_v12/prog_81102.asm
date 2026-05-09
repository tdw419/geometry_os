; DESCRIPTION: Creates a magenta rectangular region at (141, 142) spanning 19 by 22 pixels.
; PLAN: r0=141(x), r1=142(y), r2=19(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 142
LDI r2, 19
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
