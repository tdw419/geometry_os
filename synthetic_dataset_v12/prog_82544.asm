; DESCRIPTION: Composite: Places a yellow dot at position (178, 121) then Renders a blue line between points (187, 97) and (133, 4) then Places a red circle of radius 32 at center (211, 86).
; PLAN: r0=178(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=187(x1), r6=97(y1), r7=133(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=86(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 187
LDI r6, 97
LDI r7, 133
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 86
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
