; DESCRIPTION: Creates a orange rectangular region at (227, 73) spanning 56 by 76 pixels.
; PLAN: r0=227(x), r1=73(y), r2=56(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 73
LDI r2, 56
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
