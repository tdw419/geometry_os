; DESCRIPTION: Creates a purple rectangular region at (125, 91) spanning 35 by 49 pixels.
; PLAN: r0=125(x), r1=91(y), r2=35(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 91
LDI r2, 35
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
