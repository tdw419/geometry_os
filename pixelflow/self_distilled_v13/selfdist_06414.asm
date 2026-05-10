; DESCRIPTION: Creates a orange filled rectangle of size 96x55 starting at (397, 84).
; PLAN: r0=397(x), r1=84(y), r2=96(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 84
LDI r2, 96
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
