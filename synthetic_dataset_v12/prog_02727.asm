; DESCRIPTION: Composite: Places a black 23x36 rectangle at position (16, 53) then Places a blue line segment connecting (390, 80) to (448, 43).
; PLAN: r0=16(x), r1=53(y), r2=23(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x1), r6=80(y1), r7=448(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 53
LDI r2, 23
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 80
LDI r7, 448
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
