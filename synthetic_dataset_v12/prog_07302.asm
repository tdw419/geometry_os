; DESCRIPTION: Composite: Places a white dot at position (170, 57) then Places a red line segment connecting (196, 150) to (476, 240) then Draws a red circle centered at (189, 129) with radius 19.
; PLAN: r0=170(x), r1=57(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=150(y1), r7=476(x2), r8=240(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=129(y), r12=19(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 57
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 150
LDI r7, 476
LDI r8, 240
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 129
LDI r12, 19
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
