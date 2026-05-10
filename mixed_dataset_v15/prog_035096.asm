; DESCRIPTION: Composite: Sets a single red pixel at (353, 223) then Places a cyan line segment connecting (8, 106) to (290, 187) then Creates a blue circular shape at (394, 195) with radius 61.
; PLAN: r0=353(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=106(y1), r7=290(x2), r8=187(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=195(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 8
LDI r6, 106
LDI r7, 290
LDI r8, 187
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 195
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
