; DESCRIPTION: Composite: . Then Renders a black box of size 26x46 starting at (131, 152). Then Renders a yellow line between points (185, 10) and (159, 216).
; PLAN: r0=131(x), r1=152(y), r2=26(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x1), r1=10(y1), r2=159(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 26x46 starting at (131, 152).
; PLAN: r0=131(x), r1=152(y), r2=26(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 152
LDI r2, 26
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (185, 10) and (159, 216).
; PLAN: r0=185(x1), r1=10(y1), r2=159(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 10
LDI r2, 159
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
