; DESCRIPTION: Creates a purple rectangular region at (279, 134) spanning 35 by 84 pixels.
; PLAN: r0=279(x), r1=134(y), r2=35(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 134
LDI r2, 35
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
