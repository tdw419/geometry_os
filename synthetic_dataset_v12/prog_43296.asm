; DESCRIPTION: Creates a white rectangular region at (142, 105) spanning 118 by 95 pixels.
; PLAN: r0=142(x), r1=105(y), r2=118(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 105
LDI r2, 118
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
