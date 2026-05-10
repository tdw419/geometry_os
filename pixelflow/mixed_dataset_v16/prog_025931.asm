; DESCRIPTION: Renders a yellow rectangular region spanning 92 by 94 at (381, 15).
; PLAN: r0=381(x), r1=15(y), r2=92(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 15
LDI r2, 92
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
