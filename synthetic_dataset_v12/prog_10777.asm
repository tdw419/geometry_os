; DESCRIPTION: Creates a white rectangular region at (231, 2) spanning 69 by 114 pixels.
; PLAN: r0=231(x), r1=2(y), r2=69(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 2
LDI r2, 69
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
