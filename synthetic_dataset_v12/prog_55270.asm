; DESCRIPTION: Composite: Renders a orange line between points (393, 238) and (466, 225) then Places a green dot at position (222, 114).
; PLAN: r0=393(x1), r1=238(y1), r2=466(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=114(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 238
LDI r2, 466
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 114
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
