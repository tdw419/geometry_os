; DESCRIPTION: Creates a white rectangular region at (175, 101) spanning 26 by 92 pixels.
; PLAN: r0=175(x), r1=101(y), r2=26(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 101
LDI r2, 26
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
