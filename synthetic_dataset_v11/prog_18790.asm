; DESCRIPTION: Renders a blue box of size 20x92 starting at (158, 32).
; PLAN: r0=158(x), r1=32(y), r2=20(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 32
LDI r2, 20
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
