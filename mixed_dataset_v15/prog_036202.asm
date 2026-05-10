; DESCRIPTION: Renders a green rectangular region spanning 13 by 81 at (102, 103).
; PLAN: r0=102(x), r1=103(y), r2=13(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 103
LDI r2, 13
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
