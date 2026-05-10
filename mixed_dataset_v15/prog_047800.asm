; DESCRIPTION: Creates a black rectangular region at (36, 162) spanning 12 by 53 pixels.
; PLAN: r0=36(x), r1=162(y), r2=12(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 162
LDI r2, 12
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
