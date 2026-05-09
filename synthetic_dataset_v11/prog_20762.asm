; DESCRIPTION: Creates a yellow rectangular region at (77, 100) spanning 95 by 53 pixels.
; PLAN: r0=77(x), r1=100(y), r2=95(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 100
LDI r2, 95
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
