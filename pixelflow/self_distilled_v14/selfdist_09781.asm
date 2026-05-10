; DESCRIPTION: Renders a yellow rectangular region spanning 78 by 53 at (95, 160).
; PLAN: r0=95(x), r1=160(y), r2=78(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 160
LDI r2, 78
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
