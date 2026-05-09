; DESCRIPTION: Creates a black rectangular region at (80, 38) spanning 53 by 106 pixels.
; PLAN: r0=80(x), r1=38(y), r2=53(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 38
LDI r2, 53
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
