; DESCRIPTION: Creates a red rectangular region at (52, 100) spanning 105 by 102 pixels.
; PLAN: r0=52(x), r1=100(y), r2=105(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 100
LDI r2, 105
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
