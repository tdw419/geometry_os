; DESCRIPTION: Creates a black rectangular region at (143, 71) spanning 17 by 25 pixels.
; PLAN: r0=143(x), r1=71(y), r2=17(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 71
LDI r2, 17
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
