; DESCRIPTION: Creates a red rectangular region at (136, 141) spanning 105 by 18 pixels.
; PLAN: r0=136(x), r1=141(y), r2=105(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 141
LDI r2, 105
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
