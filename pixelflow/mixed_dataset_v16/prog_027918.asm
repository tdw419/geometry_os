; DESCRIPTION: Composite: Creates a yellow circular shape at (382, 157) with radius 32 then Draws a green line from (318, 253) to (3, 230) then Sets a single cyan pixel at (13, 119).
; PLAN: r0=382(x), r1=157(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=253(y1), r7=3(x2), r8=230(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=119(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 157
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 253
LDI r7, 3
LDI r8, 230
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 119
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
