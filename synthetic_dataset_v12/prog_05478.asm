; DESCRIPTION: Creates a red rectangular region at (233, 57) spanning 52 by 119 pixels.
; PLAN: r0=233(x), r1=57(y), r2=52(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 57
LDI r2, 52
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
