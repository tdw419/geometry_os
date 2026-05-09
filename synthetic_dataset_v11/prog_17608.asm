; DESCRIPTION: Creates a orange rectangular region at (67, 30) spanning 55 by 62 pixels.
; PLAN: r0=67(x), r1=30(y), r2=55(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 30
LDI r2, 55
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
