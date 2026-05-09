; DESCRIPTION: Creates a red rectangular region at (140, 102) spanning 22 by 51 pixels.
; PLAN: r0=140(x), r1=102(y), r2=22(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 102
LDI r2, 22
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
