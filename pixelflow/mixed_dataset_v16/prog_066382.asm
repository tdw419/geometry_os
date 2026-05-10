; DESCRIPTION: Creates a black rectangular region at (328, 58) spanning 105 by 114 pixels.
; PLAN: r0=328(x), r1=58(y), r2=105(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 58
LDI r2, 105
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
