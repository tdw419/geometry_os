; DESCRIPTION: Creates a magenta rectangular region at (70, 26) spanning 114 by 17 pixels.
; PLAN: r0=70(x), r1=26(y), r2=114(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 26
LDI r2, 114
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
