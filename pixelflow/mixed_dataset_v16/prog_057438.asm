; DESCRIPTION: Composite: Renders a white line between points (190, 208) and (40, 223) then Places a orange dot at position (80, 157) then Draws a orange circle centered at (424, 117) with radius 64.
; PLAN: r0=190(x1), r1=208(y1), r2=40(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=157(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=117(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 208
LDI r2, 40
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 157
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 424
LDI r11, 117
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
