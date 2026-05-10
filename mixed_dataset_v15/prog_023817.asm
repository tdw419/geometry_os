; DESCRIPTION: Renders a green rectangular region spanning 89 by 103 at (58, 25).
; PLAN: r0=58(x), r1=25(y), r2=89(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 25
LDI r2, 89
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
