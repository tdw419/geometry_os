; DESCRIPTION: Creates a black rectangular region at (133, 211) spanning 74 by 14 pixels.
; PLAN: r0=133(x), r1=211(y), r2=74(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 211
LDI r2, 74
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
