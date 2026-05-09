; DESCRIPTION: Creates a orange rectangular region at (134, 76) spanning 119 by 67 pixels.
; PLAN: r0=134(x), r1=76(y), r2=119(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 76
LDI r2, 119
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
