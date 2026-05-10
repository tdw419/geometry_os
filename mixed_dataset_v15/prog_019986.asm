; DESCRIPTION: Creates a purple rectangular region at (78, 26) spanning 62 by 54 pixels.
; PLAN: r0=78(x), r1=26(y), r2=62(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 26
LDI r2, 62
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
