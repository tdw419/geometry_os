; DESCRIPTION: Renders a purple box of size 54x110 starting at (369, 118).
; PLAN: r0=369(x), r1=118(y), r2=54(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 118
LDI r2, 54
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
