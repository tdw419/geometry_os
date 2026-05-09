; DESCRIPTION: Composite: Renders a magenta line between points (402, 157) and (430, 237) then Places a blue dot at position (76, 159).
; PLAN: r0=402(x1), r1=157(y1), r2=430(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=159(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 157
LDI r2, 430
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 159
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
