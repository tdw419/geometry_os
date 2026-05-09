; DESCRIPTION: Creates a yellow rectangular region at (397, 181) spanning 89 by 17 pixels.
; PLAN: r0=397(x), r1=181(y), r2=89(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 181
LDI r2, 89
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
