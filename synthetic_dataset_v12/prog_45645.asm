; DESCRIPTION: Composite: Draws a green line from (171, 91) to (64, 56) then Places a green circle of radius 66 at center (303, 127) then Places a cyan dot at position (378, 53).
; PLAN: r0=171(x1), r1=91(y1), r2=64(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=127(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x), r11=53(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 91
LDI r2, 64
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 127
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 53
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
