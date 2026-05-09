; DESCRIPTION: Creates a purple rectangular region at (181, 62) spanning 70 by 24 pixels.
; PLAN: r0=181(x), r1=62(y), r2=70(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 62
LDI r2, 70
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
