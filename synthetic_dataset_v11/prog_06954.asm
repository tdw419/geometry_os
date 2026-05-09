; DESCRIPTION: Creates a white rectangular region at (5, 40) spanning 73 by 101 pixels.
; PLAN: r0=5(x), r1=40(y), r2=73(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 40
LDI r2, 73
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
