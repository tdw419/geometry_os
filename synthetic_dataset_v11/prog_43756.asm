; DESCRIPTION: Creates a purple rectangular region at (20, 36) spanning 19 by 98 pixels.
; PLAN: r0=20(x), r1=36(y), r2=19(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 36
LDI r2, 19
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
