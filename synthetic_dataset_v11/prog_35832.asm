; DESCRIPTION: Creates a white rectangular region at (72, 5) spanning 101 by 78 pixels.
; PLAN: r0=72(x), r1=5(y), r2=101(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 5
LDI r2, 101
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
