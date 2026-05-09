; DESCRIPTION: Creates a red rectangular region at (161, 29) spanning 51 by 78 pixels.
; PLAN: r0=161(x), r1=29(y), r2=51(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 29
LDI r2, 51
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
