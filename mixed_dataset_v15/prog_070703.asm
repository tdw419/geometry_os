; DESCRIPTION: Creates a purple rectangular region at (436, 52) spanning 74 by 37 pixels.
; PLAN: r0=436(x), r1=52(y), r2=74(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 52
LDI r2, 74
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
