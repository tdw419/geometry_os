; DESCRIPTION: Creates a white rectangular region at (355, 89) spanning 81 by 28 pixels.
; PLAN: r0=355(x), r1=89(y), r2=81(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 89
LDI r2, 81
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
