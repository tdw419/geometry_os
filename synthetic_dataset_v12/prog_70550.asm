; DESCRIPTION: Creates a white rectangular region at (102, 88) spanning 116 by 93 pixels.
; PLAN: r0=102(x), r1=88(y), r2=116(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 88
LDI r2, 116
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
