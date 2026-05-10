; DESCRIPTION: Renders a blue box of size 29x23 starting at (412, 17).
; PLAN: r0=412(x), r1=17(y), r2=29(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 17
LDI r2, 29
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
