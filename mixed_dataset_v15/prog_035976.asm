; DESCRIPTION: Creates a white rectangular region at (325, 100) spanning 114 by 46 pixels.
; PLAN: r0=325(x), r1=100(y), r2=114(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 100
LDI r2, 114
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
