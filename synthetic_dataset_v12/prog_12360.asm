; DESCRIPTION: Composite: Sets a single green pixel at (483, 130) then Renders a red line between points (392, 101) and (277, 94) then Renders a magenta disk with center (119, 72) and radius 64.
; PLAN: r0=483(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=101(y1), r7=277(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=72(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 101
LDI r7, 277
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 72
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
