; DESCRIPTION: Creates a orange rectangular region at (45, 119) spanning 58 by 69 pixels.
; PLAN: r0=45(x), r1=119(y), r2=58(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 119
LDI r2, 58
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
