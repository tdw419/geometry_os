; DESCRIPTION: Creates a black rectangular region at (166, 66) spanning 67 by 58 pixels.
; PLAN: r0=166(x), r1=66(y), r2=67(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 66
LDI r2, 67
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
