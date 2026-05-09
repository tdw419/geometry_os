; DESCRIPTION: Composite: Renders a yellow line between points (270, 199) and (109, 2) then Places a orange dot at position (24, 167).
; PLAN: r0=270(x1), r1=199(y1), r2=109(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=167(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 199
LDI r2, 109
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 167
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
