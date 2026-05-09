; DESCRIPTION: Creates a orange rectangular region at (106, 137) spanning 19 by 115 pixels.
; PLAN: r0=106(x), r1=137(y), r2=19(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 137
LDI r2, 19
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
