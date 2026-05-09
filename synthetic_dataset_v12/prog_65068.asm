; DESCRIPTION: Renders a blue box of size 49x72 starting at (444, 20).
; PLAN: r0=444(x), r1=20(y), r2=49(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 20
LDI r2, 49
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
