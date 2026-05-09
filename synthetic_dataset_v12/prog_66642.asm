; DESCRIPTION: Creates a orange rectangular region at (243, 110) spanning 62 by 102 pixels.
; PLAN: r0=243(x), r1=110(y), r2=62(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 110
LDI r2, 62
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
