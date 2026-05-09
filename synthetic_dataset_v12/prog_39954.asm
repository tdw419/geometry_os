; DESCRIPTION: Creates a red rectangular region at (245, 158) spanning 38 by 51 pixels.
; PLAN: r0=245(x), r1=158(y), r2=38(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 158
LDI r2, 38
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
