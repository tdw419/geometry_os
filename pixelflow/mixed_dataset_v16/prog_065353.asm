; DESCRIPTION: Composite: Places a yellow circle of radius 28 at center (30, 103) then Renders a black line between points (442, 162) and (216, 30) then Places a white dot at position (45, 51).
; PLAN: r0=30(x), r1=103(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=162(y1), r7=216(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=51(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 103
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 162
LDI r7, 216
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 51
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
