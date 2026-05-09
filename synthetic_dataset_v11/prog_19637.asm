; DESCRIPTION: Creates a purple rectangular region at (163, 196) spanning 52 by 46 pixels.
; PLAN: r0=163(x), r1=196(y), r2=52(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 196
LDI r2, 52
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
