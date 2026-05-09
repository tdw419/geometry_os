; DESCRIPTION: Composite: Renders a green line between points (318, 128) and (212, 155) then Places a orange dot at position (411, 35).
; PLAN: r0=318(x1), r1=128(y1), r2=212(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=35(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 128
LDI r2, 212
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 35
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
