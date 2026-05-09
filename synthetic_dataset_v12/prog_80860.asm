; DESCRIPTION: Creates a black rectangular region at (316, 86) spanning 94 by 69 pixels.
; PLAN: r0=316(x), r1=86(y), r2=94(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 86
LDI r2, 94
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
