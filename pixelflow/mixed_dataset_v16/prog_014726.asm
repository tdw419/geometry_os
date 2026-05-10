; DESCRIPTION: Composite: Places a magenta line segment connecting (482, 198) to (260, 47) then Sets a single green pixel at (52, 120) then Places a magenta circle of radius 52 at center (162, 63).
; PLAN: r0=482(x1), r1=198(y1), r2=260(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=120(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=162(x), r11=63(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 198
LDI r2, 260
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 120
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 162
LDI r11, 63
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
