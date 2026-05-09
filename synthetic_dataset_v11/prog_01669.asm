; DESCRIPTION: Creates a white rectangular region at (153, 101) spanning 56 by 10 pixels.
; PLAN: r0=153(x), r1=101(y), r2=56(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 101
LDI r2, 56
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
