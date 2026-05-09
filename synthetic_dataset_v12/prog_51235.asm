; DESCRIPTION: Creates a black rectangular region at (195, 121) spanning 56 by 112 pixels.
; PLAN: r0=195(x), r1=121(y), r2=56(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 121
LDI r2, 56
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
