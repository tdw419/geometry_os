; DESCRIPTION: Creates a white rectangular region at (425, 49) spanning 81 by 118 pixels.
; PLAN: r0=425(x), r1=49(y), r2=81(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 49
LDI r2, 81
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
