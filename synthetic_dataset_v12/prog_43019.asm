; DESCRIPTION: Composite: Creates a blue circular shape at (408, 83) with radius 58 then Places a cyan line segment connecting (381, 70) to (350, 251).
; PLAN: r0=408(x), r1=83(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x1), r6=70(y1), r7=350(x2), r8=251(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 83
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 70
LDI r7, 350
LDI r8, 251
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
