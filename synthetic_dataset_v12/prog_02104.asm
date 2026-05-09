; DESCRIPTION: Composite: Places a green line segment connecting (489, 243) to (340, 228) then Places a purple dot at position (41, 50) then Creates a green circular shape at (24, 102) with radius 22.
; PLAN: r0=489(x1), r1=243(y1), r2=340(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=102(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 243
LDI r2, 340
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 102
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
