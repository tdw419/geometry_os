; DESCRIPTION: Renders a yellow rectangular region spanning 13 by 74 at (253, 17).
; PLAN: r0=253(x), r1=17(y), r2=13(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 17
LDI r2, 13
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
