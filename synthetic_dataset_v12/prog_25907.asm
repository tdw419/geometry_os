; DESCRIPTION: Creates a black rectangular region at (155, 74) spanning 65 by 99 pixels.
; PLAN: r0=155(x), r1=74(y), r2=65(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 74
LDI r2, 65
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
