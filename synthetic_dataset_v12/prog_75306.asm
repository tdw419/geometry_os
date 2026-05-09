; DESCRIPTION: Creates a red rectangular region at (20, 198) spanning 49 by 52 pixels.
; PLAN: r0=20(x), r1=198(y), r2=49(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 198
LDI r2, 49
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
