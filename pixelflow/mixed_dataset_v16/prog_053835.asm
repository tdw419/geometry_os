; DESCRIPTION: Composite: Renders a green disk with center (227, 106) and radius 52 then Draws a yellow line from (411, 186) to (443, 226) then Sets a single magenta pixel at (289, 207).
; PLAN: r0=227(x), r1=106(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=186(y1), r7=443(x2), r8=226(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=207(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 106
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 186
LDI r7, 443
LDI r8, 226
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 207
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
