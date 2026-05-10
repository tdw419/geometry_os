; DESCRIPTION: Composite: Draws a green circle centered at (379, 97) with radius 13 then Draws a magenta line from (371, 203) to (298, 208) then Sets a single purple pixel at (296, 238).
; PLAN: r0=379(x), r1=97(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=203(y1), r7=298(x2), r8=208(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=238(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 97
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 203
LDI r7, 298
LDI r8, 208
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 238
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
