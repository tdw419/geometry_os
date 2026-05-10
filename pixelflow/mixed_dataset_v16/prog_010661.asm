; DESCRIPTION: Composite: Places a cyan dot at position (270, 248) then Places a blue line segment connecting (448, 104) to (222, 101).
; PLAN: r0=270(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=104(y1), r7=222(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 104
LDI r7, 222
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
