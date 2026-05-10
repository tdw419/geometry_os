; DESCRIPTION: Renders a yellow rectangular region spanning 17 by 99 at (383, 43).
; PLAN: r0=383(x), r1=43(y), r2=17(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 43
LDI r2, 17
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
