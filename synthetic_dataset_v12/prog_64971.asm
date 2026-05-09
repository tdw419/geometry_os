; DESCRIPTION: Creates a black rectangular region at (67, 153) spanning 84 by 98 pixels.
; PLAN: r0=67(x), r1=153(y), r2=84(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 153
LDI r2, 84
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
