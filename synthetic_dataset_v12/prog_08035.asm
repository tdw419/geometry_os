; DESCRIPTION: Creates a purple rectangular region at (58, 140) spanning 21 by 43 pixels.
; PLAN: r0=58(x), r1=140(y), r2=21(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 140
LDI r2, 21
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
