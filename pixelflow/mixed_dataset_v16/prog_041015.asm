; DESCRIPTION: Composite: Creates a green circular shape at (244, 128) with radius 50 then Draws a magenta line from (378, 7) to (403, 110) then Places a yellow dot at position (188, 58).
; PLAN: r0=244(x), r1=128(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=7(y1), r7=403(x2), r8=110(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=58(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 128
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 7
LDI r7, 403
LDI r8, 110
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 58
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
