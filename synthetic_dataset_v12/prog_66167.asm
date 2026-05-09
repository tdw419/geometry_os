; DESCRIPTION: Creates a magenta rectangular region at (217, 122) spanning 114 by 102 pixels.
; PLAN: r0=217(x), r1=122(y), r2=114(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 122
LDI r2, 114
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
