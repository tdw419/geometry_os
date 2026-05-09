; DESCRIPTION: Creates a orange rectangular region at (282, 106) spanning 18 by 43 pixels.
; PLAN: r0=282(x), r1=106(y), r2=18(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 106
LDI r2, 18
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
