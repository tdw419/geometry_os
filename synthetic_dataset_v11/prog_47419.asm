; DESCRIPTION: Creates a black rectangular region at (67, 109) spanning 23 by 108 pixels.
; PLAN: r0=67(x), r1=109(y), r2=23(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 109
LDI r2, 23
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
