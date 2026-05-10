; DESCRIPTION: Renders a yellow rectangular region spanning 76 by 17 at (60, 131).
; PLAN: r0=60(x), r1=131(y), r2=76(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 131
LDI r2, 76
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
