; DESCRIPTION: Creates a black rectangular region at (183, 67) spanning 22 by 95 pixels.
; PLAN: r0=183(x), r1=67(y), r2=22(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 67
LDI r2, 22
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
