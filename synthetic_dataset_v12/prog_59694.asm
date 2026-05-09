; DESCRIPTION: Composite: Places a green dot at position (240, 179) then Renders a white line between points (46, 229) and (282, 76) then Renders a black disk with center (332, 129) and radius 43.
; PLAN: r0=240(x), r1=179(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=229(y1), r7=282(x2), r8=76(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=129(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 179
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 46
LDI r6, 229
LDI r7, 282
LDI r8, 76
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 129
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
