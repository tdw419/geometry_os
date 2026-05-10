; DESCRIPTION: Composite: Places a purple line segment connecting (24, 176) to (411, 25) then Places a cyan dot at position (62, 130) then Renders a white disk with center (158, 118) and radius 21.
; PLAN: r0=24(x1), r1=176(y1), r2=411(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=130(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=118(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 176
LDI r2, 411
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 130
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 118
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
