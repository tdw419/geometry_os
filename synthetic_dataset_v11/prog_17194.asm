; DESCRIPTION: Creates a black rectangular region at (112, 53) spanning 77 by 115 pixels.
; PLAN: r0=112(x), r1=53(y), r2=77(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 53
LDI r2, 77
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
