; DESCRIPTION: Creates a red rectangular region at (233, 51) spanning 22 by 47 pixels.
; PLAN: r0=233(x), r1=51(y), r2=22(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 51
LDI r2, 22
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
