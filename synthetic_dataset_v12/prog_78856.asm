; DESCRIPTION: Creates a purple rectangular region at (347, 17) spanning 60 by 109 pixels.
; PLAN: r0=347(x), r1=17(y), r2=60(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 17
LDI r2, 60
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
