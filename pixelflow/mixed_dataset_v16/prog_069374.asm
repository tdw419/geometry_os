; DESCRIPTION: Composite: Places a green dot at position (307, 103) then Places a red line segment connecting (55, 236) to (465, 43) then Places a green circle of radius 21 at center (373, 52).
; PLAN: r0=307(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=236(y1), r7=465(x2), r8=43(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=52(y), r12=21(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 55
LDI r6, 236
LDI r7, 465
LDI r8, 43
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 52
LDI r12, 21
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
