; DESCRIPTION: Composite: Renders a orange disk with center (68, 114) and radius 60 then Renders a yellow line between points (296, 103) and (309, 139) then Sets a single white pixel at (343, 160).
; PLAN: r0=68(x), r1=114(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=103(y1), r7=309(x2), r8=139(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=160(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 114
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 103
LDI r7, 309
LDI r8, 139
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 160
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
