; DESCRIPTION: Creates a black rectangular region at (18, 154) spanning 53 by 84 pixels.
; PLAN: r0=18(x), r1=154(y), r2=53(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 154
LDI r2, 53
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
