; DESCRIPTION: Composite: Creates a yellow circular shape at (86, 67) with radius 54 then Renders a yellow line between points (45, 199) and (262, 137) then Places a cyan dot at position (4, 201).
; PLAN: r0=86(x), r1=67(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=199(y1), r7=262(x2), r8=137(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=4(x), r11=201(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 67
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 199
LDI r7, 262
LDI r8, 137
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 201
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
