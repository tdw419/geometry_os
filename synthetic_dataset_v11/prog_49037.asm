; DESCRIPTION: Creates a black rectangular region at (100, 60) spanning 24 by 69 pixels.
; PLAN: r0=100(x), r1=60(y), r2=24(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 60
LDI r2, 24
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
