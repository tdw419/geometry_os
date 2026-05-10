; DESCRIPTION: Creates a blue rectangular region at (182, 123) spanning 57 by 106 pixels.
; PLAN: r0=182(x), r1=123(y), r2=57(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 123
LDI r2, 57
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
