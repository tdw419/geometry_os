; DESCRIPTION: Composite: Places a blue dot at position (366, 32) then Draws a red line from (436, 58) to (490, 5) then Places a green circle of radius 72 at center (409, 95).
; PLAN: r0=366(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=58(y1), r7=490(x2), r8=5(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=95(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 58
LDI r7, 490
LDI r8, 5
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 95
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
