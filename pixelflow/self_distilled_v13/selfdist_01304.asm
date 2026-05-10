; DESCRIPTION: Renders a yellow rectangular region spanning 101 by 39 at (376, 189).
; PLAN: r0=376(x), r1=189(y), r2=101(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 189
LDI r2, 101
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
