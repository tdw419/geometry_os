; DESCRIPTION: Composite: Places a yellow dot at position (80, 176) then Places a green circle of radius 75 at center (87, 122) then Renders a green line between points (242, 249) and (451, 129).
; PLAN: r0=80(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=122(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=249(y1), r12=451(x2), r13=129(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 87
LDI r6, 122
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 249
LDI r12, 451
LDI r13, 129
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
