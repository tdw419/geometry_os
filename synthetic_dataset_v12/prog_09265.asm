; DESCRIPTION: Creates a orange rectangular region at (407, 10) spanning 56 by 26 pixels.
; PLAN: r0=407(x), r1=10(y), r2=56(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 10
LDI r2, 56
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
