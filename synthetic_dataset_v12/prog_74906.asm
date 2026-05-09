; DESCRIPTION: Creates a black rectangular region at (217, 74) spanning 89 by 112 pixels.
; PLAN: r0=217(x), r1=74(y), r2=89(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 74
LDI r2, 89
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
