; DESCRIPTION: Creates a white rectangular region at (306, 1) spanning 89 by 93 pixels.
; PLAN: r0=306(x), r1=1(y), r2=89(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 1
LDI r2, 89
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
