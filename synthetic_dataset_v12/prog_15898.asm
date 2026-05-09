; DESCRIPTION: Creates a orange rectangular region at (205, 170) spanning 19 by 28 pixels.
; PLAN: r0=205(x), r1=170(y), r2=19(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 170
LDI r2, 19
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
