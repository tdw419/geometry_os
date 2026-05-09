; DESCRIPTION: Creates a orange rectangular region at (192, 122) spanning 88 by 25 pixels.
; PLAN: r0=192(x), r1=122(y), r2=88(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 122
LDI r2, 88
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
