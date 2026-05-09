; DESCRIPTION: Creates a orange rectangular region at (7, 43) spanning 106 by 101 pixels.
; PLAN: r0=7(x), r1=43(y), r2=106(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 43
LDI r2, 106
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
