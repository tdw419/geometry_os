; DESCRIPTION: Creates a orange rectangular region at (43, 170) spanning 59 by 70 pixels.
; PLAN: r0=43(x), r1=170(y), r2=59(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 170
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
