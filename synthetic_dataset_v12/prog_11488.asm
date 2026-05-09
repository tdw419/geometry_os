; DESCRIPTION: Creates a purple rectangular region at (313, 13) spanning 65 by 118 pixels.
; PLAN: r0=313(x), r1=13(y), r2=65(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 13
LDI r2, 65
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
