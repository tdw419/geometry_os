; DESCRIPTION: Creates a purple rectangular region at (285, 161) spanning 17 by 43 pixels.
; PLAN: r0=285(x), r1=161(y), r2=17(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 161
LDI r2, 17
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
