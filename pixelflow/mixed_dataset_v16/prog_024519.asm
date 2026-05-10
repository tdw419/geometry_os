; DESCRIPTION: Creates a orange rectangular region at (303, 6) spanning 31 by 22 pixels.
; PLAN: r0=303(x), r1=6(y), r2=31(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 6
LDI r2, 31
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
