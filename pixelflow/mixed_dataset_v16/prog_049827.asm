; DESCRIPTION: Renders a green rectangular region spanning 18 by 10 at (6, 69).
; PLAN: r0=6(x), r1=69(y), r2=18(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 69
LDI r2, 18
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
