; DESCRIPTION: Composite: Places a black line segment connecting (349, 109) to (180, 252) then Creates a white circular shape at (186, 40) with radius 37.
; PLAN: r0=349(x1), r1=109(y1), r2=180(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=40(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 109
LDI r2, 180
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 40
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
