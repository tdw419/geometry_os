; DESCRIPTION: Composite: Renders a cyan line between points (170, 166) and (5, 173) then Places a white dot at position (98, 16) then Creates a black circular shape at (250, 193) with radius 51.
; PLAN: r0=170(x1), r1=166(y1), r2=5(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=193(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 166
LDI r2, 5
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 250
LDI r11, 193
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
