; DESCRIPTION: Creates a purple rectangular region at (29, 113) spanning 99 by 56 pixels.
; PLAN: r0=29(x), r1=113(y), r2=99(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 113
LDI r2, 99
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
