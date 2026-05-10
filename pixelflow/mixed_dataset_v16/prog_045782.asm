; DESCRIPTION: Composite: Places a black circle of radius 21 at center (300, 70) then Draws a cyan line from (190, 104) to (114, 147).
; PLAN: r0=300(x), r1=70(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=104(y1), r7=114(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 70
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 104
LDI r7, 114
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
