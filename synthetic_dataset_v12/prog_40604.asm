; DESCRIPTION: Creates a orange rectangular region at (7, 20) spanning 108 by 102 pixels.
; PLAN: r0=7(x), r1=20(y), r2=108(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 20
LDI r2, 108
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
