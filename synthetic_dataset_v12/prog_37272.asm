; DESCRIPTION: Creates a orange rectangular region at (397, 19) spanning 24 by 33 pixels.
; PLAN: r0=397(x), r1=19(y), r2=24(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 19
LDI r2, 24
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
