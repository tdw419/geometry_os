; DESCRIPTION: Creates a purple rectangular region at (8, 91) spanning 43 by 70 pixels.
; PLAN: r0=8(x), r1=91(y), r2=43(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 91
LDI r2, 43
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
