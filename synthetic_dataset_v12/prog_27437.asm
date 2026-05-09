; DESCRIPTION: Creates a white rectangular region at (88, 146) spanning 34 by 89 pixels.
; PLAN: r0=88(x), r1=146(y), r2=34(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 146
LDI r2, 34
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
