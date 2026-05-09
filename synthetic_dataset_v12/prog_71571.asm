; DESCRIPTION: Composite: Renders a magenta line between points (288, 74) and (7, 216) then Sets a single cyan pixel at (209, 162) then Places a blue circle of radius 24 at center (158, 66).
; PLAN: r0=288(x1), r1=74(y1), r2=7(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=162(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=66(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 74
LDI r2, 7
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 162
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 66
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
