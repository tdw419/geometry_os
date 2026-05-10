; DESCRIPTION: Creates a purple rectangular region at (347, 43) spanning 32 by 83 pixels.
; PLAN: r0=347(x), r1=43(y), r2=32(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 43
LDI r2, 32
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
