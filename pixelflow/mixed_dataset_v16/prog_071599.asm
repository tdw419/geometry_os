; DESCRIPTION: Renders a yellow rectangular region spanning 102 by 80 at (32, 156).
; PLAN: r0=32(x), r1=156(y), r2=102(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 156
LDI r2, 102
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
