; DESCRIPTION: Creates a black rectangular region at (151, 147) spanning 25 by 81 pixels.
; PLAN: r0=151(x), r1=147(y), r2=25(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 147
LDI r2, 25
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
