; DESCRIPTION: Composite: Places a red circle of radius 77 at center (396, 178) then Renders a white line between points (36, 6) and (115, 52) then Places a blue dot at position (358, 127).
; PLAN: r0=396(x), r1=178(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x1), r6=6(y1), r7=115(x2), r8=52(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=127(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 178
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 6
LDI r7, 115
LDI r8, 52
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 127
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
