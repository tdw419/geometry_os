; DESCRIPTION: Creates a orange rectangular region at (139, 14) spanning 88 by 40 pixels.
; PLAN: r0=139(x), r1=14(y), r2=88(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 88
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
