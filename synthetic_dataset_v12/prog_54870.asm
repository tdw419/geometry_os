; DESCRIPTION: Composite: Renders a yellow line between points (375, 32) and (508, 49) then Places a white dot at position (406, 98) then Places a cyan circle of radius 66 at center (442, 81).
; PLAN: r0=375(x1), r1=32(y1), r2=508(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=98(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=81(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 32
LDI r2, 508
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 98
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 81
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
