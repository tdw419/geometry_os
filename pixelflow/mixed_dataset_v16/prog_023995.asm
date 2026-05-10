; DESCRIPTION: Composite: Places a yellow dot at position (296, 23) then Draws a blue line from (22, 57) to (20, 221) then Creates a white circular shape at (210, 75) with radius 61.
; PLAN: r0=296(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=22(x1), r6=57(y1), r7=20(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=75(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 22
LDI r6, 57
LDI r7, 20
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 75
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
