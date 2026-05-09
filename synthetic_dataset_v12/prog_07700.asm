; DESCRIPTION: Creates a orange rectangular region at (4, 69) spanning 63 by 119 pixels.
; PLAN: r0=4(x), r1=69(y), r2=63(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 69
LDI r2, 63
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
