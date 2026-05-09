; DESCRIPTION: Creates a white rectangular region at (141, 167) spanning 81 by 74 pixels.
; PLAN: r0=141(x), r1=167(y), r2=81(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 167
LDI r2, 81
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
