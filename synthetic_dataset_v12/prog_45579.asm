; DESCRIPTION: Creates a purple rectangular region at (17, 40) spanning 118 by 16 pixels.
; PLAN: r0=17(x), r1=40(y), r2=118(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 40
LDI r2, 118
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
