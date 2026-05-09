; DESCRIPTION: Creates a red rectangular region at (52, 110) spanning 28 by 89 pixels.
; PLAN: r0=52(x), r1=110(y), r2=28(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 110
LDI r2, 28
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
