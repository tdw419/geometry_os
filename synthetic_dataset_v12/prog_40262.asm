; DESCRIPTION: Composite: Draws a black circle centered at (418, 76) with radius 64 then Renders a green line between points (108, 66) and (393, 87) then Sets a single cyan pixel at (179, 183).
; PLAN: r0=418(x), r1=76(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=66(y1), r7=393(x2), r8=87(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=183(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 76
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 66
LDI r7, 393
LDI r8, 87
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 183
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
