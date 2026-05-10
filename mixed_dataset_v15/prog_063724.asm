; DESCRIPTION: Composite: Creates a cyan circular shape at (424, 165) with radius 66 then Places a red line segment connecting (201, 195) to (102, 108) then Places a yellow dot at position (441, 95).
; PLAN: r0=424(x), r1=165(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=195(y1), r7=102(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=95(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 165
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 195
LDI r7, 102
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 95
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
