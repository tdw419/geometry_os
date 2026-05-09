; DESCRIPTION: Creates a orange rectangular region at (67, 172) spanning 83 by 53 pixels.
; PLAN: r0=67(x), r1=172(y), r2=83(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 172
LDI r2, 83
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
