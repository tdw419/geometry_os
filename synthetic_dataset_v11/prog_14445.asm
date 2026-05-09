; DESCRIPTION: Creates a black rectangular region at (62, 126) spanning 19 by 113 pixels.
; PLAN: r0=62(x), r1=126(y), r2=19(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 126
LDI r2, 19
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
