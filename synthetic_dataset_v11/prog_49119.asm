; DESCRIPTION: Creates a purple rectangular region at (181, 60) spanning 43 by 99 pixels.
; PLAN: r0=181(x), r1=60(y), r2=43(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 60
LDI r2, 43
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
