; DESCRIPTION: Creates a black rectangular region at (407, 45) spanning 85 by 53 pixels.
; PLAN: r0=407(x), r1=45(y), r2=85(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 45
LDI r2, 85
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
