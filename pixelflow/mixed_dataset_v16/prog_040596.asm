; DESCRIPTION: Creates a black rectangular region at (397, 0) spanning 106 by 33 pixels.
; PLAN: r0=397(x), r1=0(y), r2=106(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 0
LDI r2, 106
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
