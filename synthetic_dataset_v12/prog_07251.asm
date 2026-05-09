; DESCRIPTION: Creates a white rectangular region at (457, 148) spanning 43 by 56 pixels.
; PLAN: r0=457(x), r1=148(y), r2=43(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 148
LDI r2, 43
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
