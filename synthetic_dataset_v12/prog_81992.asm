; DESCRIPTION: Creates a purple rectangular region at (0, 65) spanning 17 by 37 pixels.
; PLAN: r0=0(x), r1=65(y), r2=17(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 65
LDI r2, 17
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
