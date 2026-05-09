; DESCRIPTION: Creates a black rectangular region at (339, 117) spanning 14 by 40 pixels.
; PLAN: r0=339(x), r1=117(y), r2=14(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 117
LDI r2, 14
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
