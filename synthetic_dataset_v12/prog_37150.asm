; DESCRIPTION: Composite: Draws a black line from (98, 96) to (364, 152) then Places a cyan dot at position (509, 73) then Places a yellow circle of radius 24 at center (331, 183).
; PLAN: r0=98(x1), r1=96(y1), r2=364(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=509(x), r6=73(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=331(x), r11=183(y), r12=24(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 96
LDI r2, 364
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 73
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 331
LDI r11, 183
LDI r12, 24
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
