; DESCRIPTION: Creates a purple rectangular region at (12, 111) spanning 22 by 78 pixels.
; PLAN: r0=12(x), r1=111(y), r2=22(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 111
LDI r2, 22
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
