; DESCRIPTION: Creates a red rectangular region at (285, 17) spanning 74 by 118 pixels.
; PLAN: r0=285(x), r1=17(y), r2=74(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 17
LDI r2, 74
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
