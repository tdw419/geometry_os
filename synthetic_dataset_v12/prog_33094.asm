; DESCRIPTION: Composite: Renders a purple disk with center (153, 162) and radius 13 then Places a yellow line segment connecting (232, 177) to (422, 35) then Sets a single orange pixel at (330, 195).
; PLAN: r0=153(x), r1=162(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=177(y1), r7=422(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=195(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 162
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 177
LDI r7, 422
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 195
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
