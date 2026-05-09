; DESCRIPTION: Composite: Sets a single red pixel at (446, 75) then Places a magenta circle of radius 67 at center (153, 106) then Places a yellow line segment connecting (353, 232) to (271, 196).
; PLAN: r0=446(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=106(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x1), r11=232(y1), r12=271(x2), r13=196(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 106
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 232
LDI r12, 271
LDI r13, 196
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
