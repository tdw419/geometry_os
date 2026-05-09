; DESCRIPTION: Renders a blue box of size 25x78 starting at (2, 92).
; PLAN: r0=2(x), r1=92(y), r2=25(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 92
LDI r2, 25
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
