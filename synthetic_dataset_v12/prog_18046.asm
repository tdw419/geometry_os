; DESCRIPTION: Creates a black rectangular region at (385, 164) spanning 46 by 56 pixels.
; PLAN: r0=385(x), r1=164(y), r2=46(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 164
LDI r2, 46
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
