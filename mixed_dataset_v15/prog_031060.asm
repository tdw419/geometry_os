; DESCRIPTION: Creates a orange rectangular region at (67, 83) spanning 35 by 49 pixels.
; PLAN: r0=67(x), r1=83(y), r2=35(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 83
LDI r2, 35
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
