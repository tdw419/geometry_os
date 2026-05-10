; DESCRIPTION: Composite: Draws a cyan line from (276, 254) to (290, 255) then Places a green dot at position (250, 106) then Places a yellow circle of radius 39 at center (307, 170).
; PLAN: r0=276(x1), r1=254(y1), r2=290(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=106(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=170(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 254
LDI r2, 290
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 106
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 307
LDI r11, 170
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
