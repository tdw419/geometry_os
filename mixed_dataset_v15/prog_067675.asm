; DESCRIPTION: Creates a black rectangular region at (118, 146) spanning 113 by 102 pixels.
; PLAN: r0=118(x), r1=146(y), r2=113(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 146
LDI r2, 113
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
