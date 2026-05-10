; DESCRIPTION: Composite: Draws a black line from (485, 3) to (303, 77) then Sets a single cyan pixel at (457, 183) then Renders a blue disk with center (273, 82) and radius 32.
; PLAN: r0=485(x1), r1=3(y1), r2=303(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=183(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=273(x), r11=82(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 485
LDI r1, 3
LDI r2, 303
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 183
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 82
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
