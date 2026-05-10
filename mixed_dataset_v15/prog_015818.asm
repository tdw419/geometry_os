; DESCRIPTION: Creates a purple rectangular region at (12, 125) spanning 88 by 97 pixels.
; PLAN: r0=12(x), r1=125(y), r2=88(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 125
LDI r2, 88
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
