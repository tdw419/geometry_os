; DESCRIPTION: Composite: Draws a red line from (477, 104) to (124, 5) then Places a green circle of radius 16 at center (188, 67).
; PLAN: r0=477(x1), r1=104(y1), r2=124(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=67(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 104
LDI r2, 124
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 67
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
