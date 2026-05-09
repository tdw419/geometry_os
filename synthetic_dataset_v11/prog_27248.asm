; DESCRIPTION: Creates a white rectangular region at (58, 102) spanning 55 by 118 pixels.
; PLAN: r0=58(x), r1=102(y), r2=55(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 102
LDI r2, 55
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
