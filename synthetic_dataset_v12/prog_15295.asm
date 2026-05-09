; DESCRIPTION: Creates a black rectangular region at (449, 123) spanning 49 by 113 pixels.
; PLAN: r0=449(x), r1=123(y), r2=49(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 123
LDI r2, 49
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
