; DESCRIPTION: Creates a black rectangular region at (195, 127) spanning 112 by 66 pixels.
; PLAN: r0=195(x), r1=127(y), r2=112(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 127
LDI r2, 112
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
