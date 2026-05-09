; DESCRIPTION: Composite: Renders a cyan line between points (484, 159) and (218, 49) then Places a red circle of radius 10 at center (394, 195) then Sets a single red pixel at (345, 98).
; PLAN: r0=484(x1), r1=159(y1), r2=218(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=195(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=98(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 484
LDI r1, 159
LDI r2, 218
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 195
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 98
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
