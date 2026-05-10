; DESCRIPTION: Creates a orange rectangular region at (129, 67) spanning 83 by 100 pixels.
; PLAN: r0=129(x), r1=67(y), r2=83(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 67
LDI r2, 83
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
