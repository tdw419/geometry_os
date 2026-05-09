; DESCRIPTION: Creates a orange rectangular region at (219, 89) spanning 13 by 69 pixels.
; PLAN: r0=219(x), r1=89(y), r2=13(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 89
LDI r2, 13
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
