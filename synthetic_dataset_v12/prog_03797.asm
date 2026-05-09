; DESCRIPTION: Creates a black rectangular region at (397, 5) spanning 47 by 95 pixels.
; PLAN: r0=397(x), r1=5(y), r2=47(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 5
LDI r2, 47
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
