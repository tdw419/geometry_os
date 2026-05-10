; DESCRIPTION: Creates a yellow rectangular region at (349, 141) spanning 43 by 56 pixels.
; PLAN: r0=349(x), r1=141(y), r2=43(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 141
LDI r2, 43
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
