; DESCRIPTION: Creates a orange rectangular region at (247, 17) spanning 110 by 106 pixels.
; PLAN: r0=247(x), r1=17(y), r2=110(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 17
LDI r2, 110
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
