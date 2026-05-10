; DESCRIPTION: Renders a yellow rectangular region spanning 15 by 17 at (236, 129).
; PLAN: r0=236(x), r1=129(y), r2=15(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 129
LDI r2, 15
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
