; DESCRIPTION: Creates a orange rectangular region at (49, 21) spanning 102 by 26 pixels.
; PLAN: r0=49(x), r1=21(y), r2=102(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 21
LDI r2, 102
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
