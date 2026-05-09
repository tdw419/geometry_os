; DESCRIPTION: Composite: Places a magenta line segment connecting (130, 109) to (95, 18) then Places a white dot at position (372, 95) then Places a magenta circle of radius 76 at center (257, 86).
; PLAN: r0=130(x1), r1=109(y1), r2=95(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=95(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=86(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 109
LDI r2, 95
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 95
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 86
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
