; DESCRIPTION: Composite: Draws a blue line from (25, 31) to (44, 13) then Places a yellow circle of radius 76 at center (106, 128) then Places a red dot at position (251, 91).
; PLAN: r0=25(x1), r1=31(y1), r2=44(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=128(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 31
LDI r2, 44
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 128
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
