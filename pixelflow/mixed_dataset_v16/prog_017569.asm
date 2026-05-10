; DESCRIPTION: Composite: Draws a green rectangle at (363, 54) with width 11 and height 18 then Sets a single purple pixel at (320, 212) then Draws a black line from (248, 48) to (137, 147).
; PLAN: r0=363(x), r1=54(y), r2=11(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=248(x1), r11=48(y1), r12=137(x2), r13=147(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 54
LDI r2, 11
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 48
LDI r12, 137
LDI r13, 147
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
