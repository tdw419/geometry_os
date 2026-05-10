; DESCRIPTION: Creates a black rectangular region at (55, 100) spanning 50 by 53 pixels.
; PLAN: r0=55(x), r1=100(y), r2=50(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 100
LDI r2, 50
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
