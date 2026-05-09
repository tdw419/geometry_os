; DESCRIPTION: Creates a blue rectangular region at (37, 17) spanning 49 by 39 pixels.
; PLAN: r0=37(x), r1=17(y), r2=49(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 17
LDI r2, 49
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
