; DESCRIPTION: Renders a yellow rectangular region spanning 50 by 35 at (84, 17).
; PLAN: r0=84(x), r1=17(y), r2=50(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 17
LDI r2, 50
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
