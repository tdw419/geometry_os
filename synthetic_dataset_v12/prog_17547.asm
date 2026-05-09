; DESCRIPTION: Renders a blue box of size 22x37 starting at (369, 28).
; PLAN: r0=369(x), r1=28(y), r2=22(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 28
LDI r2, 22
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
