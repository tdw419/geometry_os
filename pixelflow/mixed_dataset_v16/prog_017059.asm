; DESCRIPTION: Creates a black rectangular region at (67, 43) spanning 99 by 109 pixels.
; PLAN: r0=67(x), r1=43(y), r2=99(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 43
LDI r2, 99
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
