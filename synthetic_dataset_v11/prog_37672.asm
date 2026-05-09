; DESCRIPTION: Creates a orange rectangular region at (3, 176) spanning 22 by 33 pixels.
; PLAN: r0=3(x), r1=176(y), r2=22(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 176
LDI r2, 22
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
