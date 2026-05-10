; DESCRIPTION: Creates a orange rectangular region at (67, 109) spanning 23 by 106 pixels.
; PLAN: r0=67(x), r1=109(y), r2=23(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 109
LDI r2, 23
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
