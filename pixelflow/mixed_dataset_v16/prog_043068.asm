; DESCRIPTION: Composite: Draws a purple circle centered at (412, 125) with radius 73 then Renders a white line between points (470, 101) and (161, 88).
; PLAN: r0=412(x), r1=125(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x1), r6=101(y1), r7=161(x2), r8=88(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 125
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 101
LDI r7, 161
LDI r8, 88
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
