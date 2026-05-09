; DESCRIPTION: Creates a purple rectangular region at (58, 38) spanning 21 by 19 pixels.
; PLAN: r0=58(x), r1=38(y), r2=21(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 38
LDI r2, 21
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
