; DESCRIPTION: Composite: Creates a purple circular shape at (120, 58) with radius 34 then Places a magenta line segment connecting (264, 99) to (501, 187) then Places a green dot at position (156, 51).
; PLAN: r0=120(x), r1=58(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x1), r6=99(y1), r7=501(x2), r8=187(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=51(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 58
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 99
LDI r7, 501
LDI r8, 187
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 51
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
