; DESCRIPTION: Creates a red rectangular region at (102, 77) spanning 105 by 107 pixels.
; PLAN: r0=102(x), r1=77(y), r2=105(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 77
LDI r2, 105
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
