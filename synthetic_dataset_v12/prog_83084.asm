; DESCRIPTION: Creates a black rectangular region at (385, 34) spanning 82 by 18 pixels.
; PLAN: r0=385(x), r1=34(y), r2=82(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 34
LDI r2, 82
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
