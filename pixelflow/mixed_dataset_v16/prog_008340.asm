; DESCRIPTION: Composite: Places a red circle of radius 63 at center (427, 95) then Renders a yellow line between points (249, 209) and (184, 238) then Places a black dot at position (500, 12).
; PLAN: r0=427(x), r1=95(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=209(y1), r7=184(x2), r8=238(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=500(x), r11=12(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 427
LDI r1, 95
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 209
LDI r7, 184
LDI r8, 238
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 12
LDI r12, 0x000000
PSET r10, r11, r12
HALT
