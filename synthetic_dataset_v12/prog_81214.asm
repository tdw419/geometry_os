; DESCRIPTION: Composite: Renders a red disk with center (376, 106) and radius 30 then Draws a yellow line from (430, 129) to (289, 65) then Places a red dot at position (320, 165).
; PLAN: r0=376(x), r1=106(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x1), r6=129(y1), r7=289(x2), r8=65(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=165(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 106
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 129
LDI r7, 289
LDI r8, 65
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 165
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
