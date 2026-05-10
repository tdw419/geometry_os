; DESCRIPTION: Composite: Draws a black line from (297, 80) to (0, 244) then Draws a green circle centered at (365, 104) with radius 68.
; PLAN: r0=297(x1), r1=80(y1), r2=0(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=104(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 80
LDI r2, 0
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 104
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
