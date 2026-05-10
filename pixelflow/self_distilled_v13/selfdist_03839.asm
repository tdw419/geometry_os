; DESCRIPTION: Renders a yellow rectangular region spanning 83 by 45 at (325, 7).
; PLAN: r0=325(x), r1=7(y), r2=83(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 7
LDI r2, 83
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
