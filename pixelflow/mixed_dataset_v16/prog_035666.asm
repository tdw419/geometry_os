; DESCRIPTION: Composite: Places a yellow line segment connecting (440, 5) to (435, 82) then Renders a cyan disk with center (442, 101) and radius 56 then Sets a single blue pixel at (258, 225).
; PLAN: r0=440(x1), r1=5(y1), r2=435(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=101(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=225(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 5
LDI r2, 435
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 101
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 225
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
