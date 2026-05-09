; DESCRIPTION: Creates a purple rectangular region at (111, 136) spanning 17 by 99 pixels.
; PLAN: r0=111(x), r1=136(y), r2=17(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 136
LDI r2, 17
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
