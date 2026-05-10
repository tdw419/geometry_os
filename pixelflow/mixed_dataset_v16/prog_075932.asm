; DESCRIPTION: Creates a white rectangular region at (3, 102) spanning 97 by 101 pixels.
; PLAN: r0=3(x), r1=102(y), r2=97(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 102
LDI r2, 97
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
