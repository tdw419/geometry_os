; DESCRIPTION: Creates a orange rectangular region at (318, 22) spanning 112 by 10 pixels.
; PLAN: r0=318(x), r1=22(y), r2=112(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 22
LDI r2, 112
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
