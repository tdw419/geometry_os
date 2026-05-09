; DESCRIPTION: Creates a red rectangular region at (17, 148) spanning 118 by 105 pixels.
; PLAN: r0=17(x), r1=148(y), r2=118(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 148
LDI r2, 118
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
