; DESCRIPTION: Creates a red rectangular region at (25, 51) spanning 26 by 78 pixels.
; PLAN: r0=25(x), r1=51(y), r2=26(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 51
LDI r2, 26
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
