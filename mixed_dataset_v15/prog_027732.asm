; DESCRIPTION: Creates a black rectangular region at (17, 69) spanning 42 by 89 pixels.
; PLAN: r0=17(x), r1=69(y), r2=42(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 69
LDI r2, 42
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
