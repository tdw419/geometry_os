; DESCRIPTION: Composite: Sets a single red pixel at (426, 106) then Renders a blue disk with center (137, 126) and radius 51 then Places a green line segment connecting (50, 87) to (280, 89).
; PLAN: r0=426(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=126(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x1), r11=87(y1), r12=280(x2), r13=89(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 137
LDI r6, 126
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 87
LDI r12, 280
LDI r13, 89
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
