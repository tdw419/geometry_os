; DESCRIPTION: Composite: Renders a cyan line between points (96, 75) and (239, 77) then Places a yellow dot at position (311, 188) then Places a cyan circle of radius 26 at center (95, 51).
; PLAN: r0=96(x1), r1=75(y1), r2=239(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=188(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=95(x), r11=51(y), r12=26(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 75
LDI r2, 239
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 188
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 95
LDI r11, 51
LDI r12, 26
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
