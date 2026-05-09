; DESCRIPTION: Creates a red rectangular region at (141, 105) spanning 70 by 102 pixels.
; PLAN: r0=141(x), r1=105(y), r2=70(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 105
LDI r2, 70
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
