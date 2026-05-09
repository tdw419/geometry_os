; DESCRIPTION: Composite: Places a purple circle of radius 62 at center (174, 80) then Places a green line segment connecting (486, 197) to (496, 225) then Places a magenta dot at position (33, 231).
; PLAN: r0=174(x), r1=80(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=197(y1), r7=496(x2), r8=225(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=231(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 80
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 197
LDI r7, 496
LDI r8, 225
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 231
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
