; DESCRIPTION: Creates a black rectangular region at (436, 144) spanning 46 by 112 pixels.
; PLAN: r0=436(x), r1=144(y), r2=46(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 144
LDI r2, 46
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
