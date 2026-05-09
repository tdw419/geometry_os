; DESCRIPTION: Creates a yellow rectangular region at (167, 115) spanning 38 by 15 pixels.
; PLAN: r0=167(x), r1=115(y), r2=38(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 115
LDI r2, 38
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
