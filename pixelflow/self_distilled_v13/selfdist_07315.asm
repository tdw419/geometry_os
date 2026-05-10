; DESCRIPTION: Renders a yellow rectangular region spanning 76 by 105 at (264, 9).
; PLAN: r0=264(x), r1=9(y), r2=76(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 9
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
