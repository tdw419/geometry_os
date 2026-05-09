; DESCRIPTION: Creates a red rectangular region at (70, 97) spanning 69 by 114 pixels.
; PLAN: r0=70(x), r1=97(y), r2=69(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 97
LDI r2, 69
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
