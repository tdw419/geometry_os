; DESCRIPTION: Composite: . Then Renders a yellow disk with center (169, 152) and radius 74. Then Renders a blue box of size 86x106 starting at (145, 110).
; PLAN: r0=169(x), r1=152(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x), r1=110(y), r2=86(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (169, 152) and radius 74.
; PLAN: r0=169(x), r1=152(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 152
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 86x106 starting at (145, 110).
; PLAN: r0=145(x), r1=110(y), r2=86(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 110
LDI r2, 86
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
