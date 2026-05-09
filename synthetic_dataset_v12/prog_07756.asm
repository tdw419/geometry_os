; DESCRIPTION: Creates a black rectangular region at (129, 74) spanning 40 by 101 pixels.
; PLAN: r0=129(x), r1=74(y), r2=40(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 74
LDI r2, 40
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
