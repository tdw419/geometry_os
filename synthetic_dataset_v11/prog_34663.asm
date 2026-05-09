; DESCRIPTION: Creates a orange rectangular region at (76, 0) spanning 114 by 73 pixels.
; PLAN: r0=76(x), r1=0(y), r2=114(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 0
LDI r2, 114
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
