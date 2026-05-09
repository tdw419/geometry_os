; DESCRIPTION: Creates a orange rectangular region at (427, 123) spanning 23 by 27 pixels.
; PLAN: r0=427(x), r1=123(y), r2=23(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 123
LDI r2, 23
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
