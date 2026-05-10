; DESCRIPTION: Renders a green rectangular region spanning 119 by 46 at (143, 53).
; PLAN: r0=143(x), r1=53(y), r2=119(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 53
LDI r2, 119
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
