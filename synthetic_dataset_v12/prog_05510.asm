; DESCRIPTION: Creates a orange rectangular region at (62, 125) spanning 69 by 30 pixels.
; PLAN: r0=62(x), r1=125(y), r2=69(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 125
LDI r2, 69
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
