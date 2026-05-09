; DESCRIPTION: Composite: Draws a blue line from (368, 216) to (290, 84) then Renders a purple disk with center (218, 84) and radius 19.
; PLAN: r0=368(x1), r1=216(y1), r2=290(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=84(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 216
LDI r2, 290
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 84
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
