; DESCRIPTION: Creates a purple rectangular region at (261, 43) spanning 18 by 82 pixels.
; PLAN: r0=261(x), r1=43(y), r2=18(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 43
LDI r2, 18
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
