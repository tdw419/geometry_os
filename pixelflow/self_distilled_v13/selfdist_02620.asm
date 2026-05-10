; DESCRIPTION: Renders a yellow rectangular region spanning 17 by 25 at (261, 39).
; PLAN: r0=261(x), r1=39(y), r2=17(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 39
LDI r2, 17
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
