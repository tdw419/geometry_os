; DESCRIPTION: Composite: Places a cyan circle of radius 26 at center (104, 156) then Places a red line segment connecting (353, 8) to (124, 206).
; PLAN: r0=104(x), r1=156(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x1), r6=8(y1), r7=124(x2), r8=206(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 156
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 8
LDI r7, 124
LDI r8, 206
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
