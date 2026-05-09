; DESCRIPTION: Creates a black rectangular region at (53, 60) spanning 120 by 11 pixels.
; PLAN: r0=53(x), r1=60(y), r2=120(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 60
LDI r2, 120
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
