; DESCRIPTION: Creates a orange rectangular region at (56, 155) spanning 58 by 83 pixels.
; PLAN: r0=56(x), r1=155(y), r2=58(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 155
LDI r2, 58
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
