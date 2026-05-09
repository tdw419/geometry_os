; DESCRIPTION: Creates a orange rectangular region at (153, 200) spanning 36 by 13 pixels.
; PLAN: r0=153(x), r1=200(y), r2=36(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 200
LDI r2, 36
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
