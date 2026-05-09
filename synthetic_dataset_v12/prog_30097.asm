; DESCRIPTION: Composite: Draws a white line from (478, 192) to (215, 190) then Places a cyan dot at position (159, 231) then Draws a cyan circle centered at (175, 99) with radius 20.
; PLAN: r0=478(x1), r1=192(y1), r2=215(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=175(x), r11=99(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 478
LDI r1, 192
LDI r2, 215
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 175
LDI r11, 99
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
