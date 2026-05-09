; DESCRIPTION: Creates a red rectangular region at (0, 51) spanning 116 by 18 pixels.
; PLAN: r0=0(x), r1=51(y), r2=116(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 116
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
