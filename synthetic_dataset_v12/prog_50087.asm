; DESCRIPTION: Composite: Places a red circle of radius 25 at center (283, 49) then Places a cyan dot at position (409, 190) then Draws a red line from (438, 48) to (153, 218).
; PLAN: r0=283(x), r1=49(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=438(x1), r11=48(y1), r12=153(x2), r13=218(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 49
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 48
LDI r12, 153
LDI r13, 218
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
