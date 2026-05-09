; DESCRIPTION: Composite: Draws a blue circle centered at (420, 162) with radius 58 then Renders a yellow line between points (1, 135) and (178, 30) then Sets a single purple pixel at (2, 220).
; PLAN: r0=420(x), r1=162(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=135(y1), r7=178(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=220(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 162
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 135
LDI r7, 178
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 220
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
