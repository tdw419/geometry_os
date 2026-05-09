; DESCRIPTION: Creates a white rectangular region at (339, 92) spanning 96 by 20 pixels.
; PLAN: r0=339(x), r1=92(y), r2=96(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 92
LDI r2, 96
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
