; DESCRIPTION: Composite: Sets a single cyan pixel at (338, 176) then Draws a black line from (265, 107) to (175, 133) then Renders a white disk with center (109, 99) and radius 65.
; PLAN: r0=338(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=265(x1), r6=107(y1), r7=175(x2), r8=133(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=109(x), r11=99(y), r12=65(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 107
LDI r7, 175
LDI r8, 133
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 99
LDI r12, 65
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
