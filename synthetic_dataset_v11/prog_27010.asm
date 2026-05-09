; DESCRIPTION: Creates a orange rectangular region at (105, 139) spanning 52 by 108 pixels.
; PLAN: r0=105(x), r1=139(y), r2=52(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 139
LDI r2, 52
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
