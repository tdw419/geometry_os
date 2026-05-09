; DESCRIPTION: Renders a blue box of size 105x90 starting at (314, 59).
; PLAN: r0=314(x), r1=59(y), r2=105(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 59
LDI r2, 105
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
