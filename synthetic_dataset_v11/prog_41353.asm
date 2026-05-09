; DESCRIPTION: Creates a orange rectangular region at (89, 17) spanning 29 by 115 pixels.
; PLAN: r0=89(x), r1=17(y), r2=29(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 17
LDI r2, 29
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
