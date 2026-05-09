; DESCRIPTION: Creates a black rectangular region at (385, 128) spanning 113 by 51 pixels.
; PLAN: r0=385(x), r1=128(y), r2=113(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 128
LDI r2, 113
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
