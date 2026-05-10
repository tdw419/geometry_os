; DESCRIPTION: Renders a green rectangular region spanning 71 by 51 at (111, 10).
; PLAN: r0=111(x), r1=10(y), r2=71(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 71
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
