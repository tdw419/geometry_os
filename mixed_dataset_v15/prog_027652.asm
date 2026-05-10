; DESCRIPTION: Composite: Renders a yellow disk with center (380, 197) and radius 58 then Renders a blue line between points (106, 156) and (62, 97) then Places a red dot at position (324, 206).
; PLAN: r0=380(x), r1=197(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=156(y1), r7=62(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=206(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 197
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 156
LDI r7, 62
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 206
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
