; DESCRIPTION: Creates a blue rectangular region at (306, 49) spanning 43 by 72 pixels.
; PLAN: r0=306(x), r1=49(y), r2=43(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 49
LDI r2, 43
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
