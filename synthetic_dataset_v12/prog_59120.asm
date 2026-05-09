; DESCRIPTION: Composite: Sets a single purple pixel at (284, 247) then Renders a orange line between points (148, 168) and (336, 88) then Draws a blue circle centered at (326, 110) with radius 74.
; PLAN: r0=284(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=168(y1), r7=336(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=110(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 168
LDI r7, 336
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 110
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
