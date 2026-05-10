; DESCRIPTION: Creates a yellow rectangular region at (325, 94) spanning 107 by 34 pixels.
; PLAN: r0=325(x), r1=94(y), r2=107(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 94
LDI r2, 107
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
