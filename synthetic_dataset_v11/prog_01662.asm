; DESCRIPTION: Creates a orange rectangular region at (100, 91) spanning 62 by 51 pixels.
; PLAN: r0=100(x), r1=91(y), r2=62(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 91
LDI r2, 62
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
