; DESCRIPTION: Composite: Draws a yellow circle centered at (34, 107) with radius 24 then Draws a magenta line from (126, 124) to (83, 72) then Sets a single green pixel at (381, 176).
; PLAN: r0=34(x), r1=107(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x1), r6=124(y1), r7=83(x2), r8=72(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=176(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 107
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 124
LDI r7, 83
LDI r8, 72
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 176
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
