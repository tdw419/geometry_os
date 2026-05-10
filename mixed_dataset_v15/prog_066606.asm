; DESCRIPTION: Composite: Draws a green line from (201, 45) to (279, 190) then Creates a yellow circular shape at (464, 157) with radius 28 then Places a red dot at position (11, 124).
; PLAN: r0=201(x1), r1=45(y1), r2=279(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=157(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=124(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 45
LDI r2, 279
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 157
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 124
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
