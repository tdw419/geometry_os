; DESCRIPTION: Creates a purple rectangular region at (397, 9) spanning 64 by 34 pixels.
; PLAN: r0=397(x), r1=9(y), r2=64(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 9
LDI r2, 64
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
