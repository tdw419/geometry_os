; DESCRIPTION: Creates a white rectangular region at (118, 121) spanning 71 by 105 pixels.
; PLAN: r0=118(x), r1=121(y), r2=71(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 121
LDI r2, 71
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
