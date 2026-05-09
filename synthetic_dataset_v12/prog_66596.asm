; DESCRIPTION: Creates a black rectangular region at (397, 147) spanning 111 by 72 pixels.
; PLAN: r0=397(x), r1=147(y), r2=111(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 147
LDI r2, 111
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
