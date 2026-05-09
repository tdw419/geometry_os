; DESCRIPTION: Creates a orange rectangular region at (3, 52) spanning 17 by 118 pixels.
; PLAN: r0=3(x), r1=52(y), r2=17(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 52
LDI r2, 17
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
