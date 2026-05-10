; DESCRIPTION: Composite: Places a white circle of radius 25 at center (375, 45) then Draws a green line from (139, 173) to (287, 225) then Sets a single purple pixel at (73, 26).
; PLAN: r0=375(x), r1=45(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x1), r6=173(y1), r7=287(x2), r8=225(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=26(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 45
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 173
LDI r7, 287
LDI r8, 225
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 26
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
