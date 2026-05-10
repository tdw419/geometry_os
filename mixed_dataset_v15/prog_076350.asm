; DESCRIPTION: Composite: Places a cyan line segment connecting (37, 70) to (160, 95) then Places a cyan dot at position (164, 47) then Renders a blue disk with center (147, 126) and radius 65.
; PLAN: r0=37(x1), r1=70(y1), r2=160(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=126(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 70
LDI r2, 160
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 147
LDI r11, 126
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
