; DESCRIPTION: Composite: Draws a white line from (350, 37) to (454, 20) then Places a black circle of radius 51 at center (285, 89) then Places a blue dot at position (155, 182).
; PLAN: r0=350(x1), r1=37(y1), r2=454(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=89(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=182(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 37
LDI r2, 454
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 89
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 182
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
