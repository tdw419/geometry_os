; DESCRIPTION: Creates a purple rectangular region at (176, 88) spanning 33 by 111 pixels.
; PLAN: r0=176(x), r1=88(y), r2=33(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 88
LDI r2, 33
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
