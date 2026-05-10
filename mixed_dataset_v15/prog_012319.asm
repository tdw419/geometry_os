; DESCRIPTION: Composite: Renders a yellow line between points (394, 117) and (84, 159) then Renders a yellow disk with center (316, 192) and radius 31 then Places a cyan dot at position (408, 39).
; PLAN: r0=394(x1), r1=117(y1), r2=84(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=192(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=39(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 117
LDI r2, 84
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 192
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 39
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
