; DESCRIPTION: Creates a red rectangular region at (457, 51) spanning 19 by 24 pixels.
; PLAN: r0=457(x), r1=51(y), r2=19(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 51
LDI r2, 19
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
