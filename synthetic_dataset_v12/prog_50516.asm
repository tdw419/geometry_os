; DESCRIPTION: Creates a purple rectangular region at (105, 83) spanning 57 by 117 pixels.
; PLAN: r0=105(x), r1=83(y), r2=57(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 83
LDI r2, 57
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
