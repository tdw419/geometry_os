; DESCRIPTION: Composite: Renders a red disk with center (343, 159) and radius 75 then Renders a green line between points (16, 105) and (82, 144) then Sets a single purple pixel at (148, 148).
; PLAN: r0=343(x), r1=159(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x1), r6=105(y1), r7=82(x2), r8=144(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=148(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 159
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 105
LDI r7, 82
LDI r8, 144
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 148
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
