; DESCRIPTION: Creates a red rectangular region at (36, 164) spanning 26 by 88 pixels.
; PLAN: r0=36(x), r1=164(y), r2=26(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 164
LDI r2, 26
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
