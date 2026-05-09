; DESCRIPTION: Creates a orange rectangular region at (62, 153) spanning 19 by 58 pixels.
; PLAN: r0=62(x), r1=153(y), r2=19(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 153
LDI r2, 19
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
