; DESCRIPTION: Composite: Places a white dot at position (251, 123) then Renders a cyan line between points (52, 237) and (355, 30) then Renders a blue disk with center (148, 153) and radius 59.
; PLAN: r0=251(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=237(y1), r7=355(x2), r8=30(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=153(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 237
LDI r7, 355
LDI r8, 30
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 153
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
