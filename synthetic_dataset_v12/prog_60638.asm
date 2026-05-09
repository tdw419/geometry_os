; DESCRIPTION: Creates a purple rectangular region at (315, 214) spanning 17 by 38 pixels.
; PLAN: r0=315(x), r1=214(y), r2=17(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 214
LDI r2, 17
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
