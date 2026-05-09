; DESCRIPTION: Creates a orange rectangular region at (148, 49) spanning 84 by 100 pixels.
; PLAN: r0=148(x), r1=49(y), r2=84(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 49
LDI r2, 84
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
