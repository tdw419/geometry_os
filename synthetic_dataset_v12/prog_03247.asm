; DESCRIPTION: Creates a purple rectangular region at (424, 167) spanning 52 by 14 pixels.
; PLAN: r0=424(x), r1=167(y), r2=52(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 167
LDI r2, 52
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
