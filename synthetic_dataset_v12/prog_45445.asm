; DESCRIPTION: Creates a purple rectangular region at (299, 164) spanning 118 by 17 pixels.
; PLAN: r0=299(x), r1=164(y), r2=118(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 164
LDI r2, 118
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
