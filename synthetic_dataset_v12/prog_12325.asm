; DESCRIPTION: Creates a red rectangular region at (388, 28) spanning 52 by 34 pixels.
; PLAN: r0=388(x), r1=28(y), r2=52(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 28
LDI r2, 52
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
